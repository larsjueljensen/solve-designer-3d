--------------------------------------------------------------------------------
--  Function......... : AddArticle
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.AddArticle ( sName, x, y, z )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
	local hUser = this.getUser ( )
    local hNewObject = scene.createRuntimeObject ( hScene, sName )
    local nSceneModelCount = user.getAIVariable ( hUser, "MovingObject", "nSceneModels" )
    local tObjects = user.getAIVariable ( hUser, "MovingObject", "tObjectGroup" )
    log.message ( "AddArticle: ", x, " " , y, " ", z )
    
    local nX, nY, nZ = string.toNumber ( x ),  string.toNumber ( y ),  string.toNumber ( z )
    
    object.setTranslation( hNewObject, nX, nY, nZ, object.kGlobalSpace )
    
    
            object.addAIModel ( hNewObject, "SliderTarget" )
            local nSceneModelCount  = nSceneModelCount + 1
            user.setAIVariable (  hUser, "MovingObject", "nSceneModels", nSceneModelCount )
            
            --Place object correctly in Y axis based on type
            
            object.addAIModel ( hNewObject, "ObjectAI" )
            local sTag = "Object_"..nSceneModelCount
            scene.setRuntimeObjectTag ( hScene, hNewObject, sTag )
            
            --Update db.
            user.sendEvent ( hUser,  "DesignerPlugin_Main", "onAddArticle", sTag ) 
            
            --Hide object
            --object.setVisible ( hNewObject, false  )
            table.add ( tObjects, sTag )
        
        --user.sendEvent ( hUser, "MovingObject", "onRecordAction", sTag, 0 )

	
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
