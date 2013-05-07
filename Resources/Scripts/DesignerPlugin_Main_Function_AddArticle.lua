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
    local nX, nY, nZ = string.toNumber ( x ),  string.toNumber ( y ),  string.toNumber ( z )
    
    object.setTranslation( hNewObject, nX, nY, nZ, object.kGlobalSpace )
    object.addAIModel ( hNewObject, "SliderTarget" )
    object.addAIModel ( hNewObject, "ObjectAI" )

    local nSceneModelCount  = nSceneModelCount + 1
    user.setAIVariable (  hUser, "MovingObject", "nSceneModels", nSceneModelCount )
    
    local sTag = "Object_"..nSceneModelCount
    scene.setRuntimeObjectTag ( hScene, hNewObject, sTag )
    
    user.sendEvent ( hUser,  "DesignerPlugin_Main", "onAddArticle", sTag ) 
    table.add ( tObjects, sTag )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
