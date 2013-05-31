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
        
        if nBtn == 1 then
            local hComp = hud.getComponent ( hUser, "main.DeleteButton" )
            hud.setComponentPosition ( hComp, this.nCursorStartX ( ), this.nCursorStartY ( ) )
        
            --Get cursor pos to switch button side.
            local x, y = hud.getCursorPosition ( this.getUser ( ) )
            
            if x > 85 then
                hud.setComponentOrigin ( hComp, hud.kOriginTopRight )
            elseif x < 85 then
                hud.setComponentOrigin ( hComp, hud.kOriginTopLeft )
            end
            
            hud.setComponentVisible ( hComp, true )

        elseif nBtn == 0 then

            hud.setComponentVisible ( hComp, true )
            
        end
	end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
