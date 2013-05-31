--------------------------------------------------------------------------------
--  Handler.......... : onRoomInfo
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onRoomInfo (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local hComponent = hud.getComponent ( hUser, "controls.RoomInfo"  )
    local bIsVisible = hud.isComponentVisible ( hComponent )
    
    if bIsVisible == true then
        hud.callAction ( hUser, "controls.RoomInfoHide" )
    else
        hud.callAction ( hUser, "controls.RoomInfoShow" )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
