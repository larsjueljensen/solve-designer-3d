--------------------------------------------------------------------------------
--  Handler.......... : onDeleteSelectedObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onDeleteSelectedObject (  )
--------------------------------------------------------------------------------
	

    local sTagToDelete = user.getAIVariable ( this.getUser ( ), "HighlightController", "selectedObjectTag" )
	
    if ( sTagToDelete ~= nil and not string.isEmpty ( sTagToDelete ) ) then
    
        local hScene = application.getCurrentUserScene ( )
        local hObjectToDelete = scene.getTaggedObject ( hScene, sTagToDelete )
        if (hObjectToDelete ~= nil) then
            scene.destroyRuntimeObject ( hScene, hObjectToDelete )
            user.setAIVariable ( this.getUser ( ), "HighlightController", "selectedObjectTag", "NO OBJECT SELECTED" )
        end
    
    end
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
