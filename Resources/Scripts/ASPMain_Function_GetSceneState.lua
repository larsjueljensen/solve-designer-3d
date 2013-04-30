--------------------------------------------------------------------------------
--  Function......... : GetSceneState
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.GetSceneState ( )
--------------------------------------------------------------------------------
	local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser ( )
	local tObjects = user.getAIVariable ( this.getUser ( ), "MovingObject", "tObjectGroup" )
    local hList = hud.getComponent ( hUser, "DialogsHUD.SceneObjects" )
    log.message ( "got handle to table: ", tObjects )
    
    local nSize = table.getSize ( tObjects )
    
    for i = 0, nSize - 1
    do
    
    local sItem = table.getAt ( tObjects, i )
    
        if sItem then
        log.message ( "GET SCENE STATE. ", sItem )
        
        --Position
        local hObjectX, hObjectY, hObjectZ = object.getTranslation ( scene.getTaggedObject ( hScene, sItem ), object.kGlobalSpace )
        
        log.message ( "Object coordinates = X, Y ,Z ", hObjectX," ", hObjectY," ", hObjectZ )
        --Rotation
        local hObjectRotX, ObjectRotY, ObjectRotZ = object.getRotation ( scene.getTaggedObject ( hScene, sItem ), object.kGlobalSpace )
        
        log.message ( "Object rotation = rX, rY ,rZ ", hObjectX," ", hObjectY," ", hObjectZ )
        --Texturedata
        local sTexture_1  = shape.getMeshSubsetMaterialEffectMap0 ( scene.getTaggedObject ( hScene, sItem ), 0 )
        
        log.message ( "Object subset texture: ", sTexture_1 )

        local sTexture_2  = shape.getMeshSubsetMaterialEffectMap0 ( scene.getTaggedObject ( hScene, sItem ), 1 )
        
        log.message ( "Object subset texture: ", sTexture_2 )
        
        local sTexture_3  = shape.getMeshSubsetMaterialEffectMap0 ( scene.getTaggedObject ( hScene, sItem ), 2 ) 
        
        log.message ( "Object subset texture: ", sTexture_3 )



    end
    --hud.setListItemTextAt ( hList, i, 0, sItem )
    end
    
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
