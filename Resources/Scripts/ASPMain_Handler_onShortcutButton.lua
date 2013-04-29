--------------------------------------------------------------------------------
--  Handler.......... : onShortcutButton
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onShortcutButton (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
	local hMenu = hud.getComponent ( hUser, "controls.ShortcutHolder" )
    
    local bIsVisible = hud.isComponentVisible ( hMenu )
    
    if bIsVisible == true then
    
    hud.callAction ( hUser, "controls.HideShortcuts" )
    
    else
    hud.callAction ( hUser, "controls.ShowShortcuts" )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
