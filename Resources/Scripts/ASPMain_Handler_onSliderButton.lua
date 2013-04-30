--------------------------------------------------------------------------------
--  Handler.......... : onSliderButton
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSliderButton (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
	local hButton = hud.getUnderCursorComponent ( hUser )
    
    if hButton then
    local nButtonR, nButtonG, nButtonB = hud.getComponentForegroundColor ( hButton )
    
    
    
        if nButtonR == 127 then 
        hud.setComponentForegroundColor ( hButton, 0, 65, 127, 255 )
        else 
        hud.setComponentForegroundColor ( hButton, 120, 127, 127, 255 )
        end
	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
