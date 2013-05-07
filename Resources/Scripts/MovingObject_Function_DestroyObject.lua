--------------------------------------------------------------------------------
--  Function......... : DestroyObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.DestroyObject ( hObject )
--------------------------------------------------------------------------------
   
    if hObject == nil then
        hObject = this.hLastObject ( )
    end
    
    if hObject then
    
        local nModels = this.nSceneModels ( )
        local tObjects = this.tObjectGroup ( )
        local sTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hObject )    
        local nSize = table.getSize ( tObjects )
        
        for i = 0 , nSize-1 do
        
            local sObject = table.getAt ( tObjects, i )

            if sObject == sTag then      
                table.removeAt ( tObjects, i )
                this.nSceneModels ( nModels - 1)
            end
        end
        
        local sName = object.getModelName ( hObject )
        local x, y, z = object.getTranslation ( hObject, object.kGlobalSpace )
        
        this.RecordAction ( sName, 1, x, y, z )
        scene.destroyRuntimeObject ( application.getCurrentUserScene ( ), hObject )
        user.sendEvent ( this.getUser ( ), "DesignerPlugin_Main", "onRemoveArticle", sTag )
        
        --return sTag
    end

    --return nil
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
