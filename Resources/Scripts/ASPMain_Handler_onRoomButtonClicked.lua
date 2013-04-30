--------------------------------------------------------------------------------
--  Handler.......... : onRoomButtonClicked
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onRoomButtonClicked (  )
--------------------------------------------------------------------------------
	
	
    
    local hUser = application.getCurrentUser ( )
    local hButton = hud.getUnderCursorComponent ( hUser )
    local hRoomEdit = hud.getComponent ( hUser, "HUD_sidemenu.RoomEditor" )
    local hObjectEdit = hud.getComponent ( hUser, "HUD_sidemenu.ObjectEditor" )
    local hWnd = hud.getComponent ( hUser, "HUD_sidemenu.ToolsMain" )
    
    log.message ( "Got handle to window: ", hWnd )
    
    if hud.isComponentVisible ( hWnd ) then
    
                --Hide window
                --
                hud.callAction ( hUser,  "HUD_sidemenu.CloseToolsWindow")
    
    else
                         log.message ( "Room editor selected" )
                hud.setComponentVisible ( hRoomEdit, true )
                hud.setComponentVisible ( hObjectEdit, false )

                hud.callAction ( hUser,  "HUD_sidemenu.ShowToolsWindow")
       

    
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
