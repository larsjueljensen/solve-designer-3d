--------------------------------------------------------------------------------
--  Handler.......... : onPopup
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onPopup ( nBtn  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    if this.hLastObject ( ) ~= nil then
    local sObjectTag = scene.getObjectTag ( application.getCurrentUserScene( ), this.hLastObject ( ) )

	
        if nBtn == 1 
        then
        
        log.message ( "onPopup : ", nBtn )

        local hComp = hud.getComponent ( hUser, "main.DeleteButton" )
        
        log.message ( "hComp: ", hComp )
        log.message ( this.nCursorStartX ( ) )
        log.message ( this.nCursorStartY ( ) )
        
        hud.setComponentPosition ( hComp, this.nCursorStartX ( ), this.nCursorStartY ( ) )
        
        --Get cursor pos to switch button side.
        local x, y = hud.getCursorPosition ( this.getUser ( ) )
        
        if x > 85 then
        
        hud.setComponentOrigin ( hComp, hud.kOriginTopRight )
        elseif x < 85 then
        hud.setComponentOrigin ( hComp, hud.kOriginTopLeft )
        end
        
        
        hud.setComponentVisible ( hComp, true )
        local bIsVisible = hud.isComponentVisible ( hComp )
        
        log.message ( "Visible: ", bIsVisible )
        local x, y = hud.getComponentPosition ( hComp )
        log.message ( "x, y: ", x, "  ", y )
       
        
        
        --Update selection label.
        
--         local hLabel = hud.getComponent ( hUser, "Dialogs.Label" )
--         
--         log.message ( "Got label: ", hLabel )
--         hud.setLabelText ( hLabel, sObjectTag )
--         
--         
        elseif nBtn == 0 
        then
        --this.DestroyObject (  )
        hud.setComponentVisible ( hComp, true )
        
        elseif nBtn == 2 
        then
        end
	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
