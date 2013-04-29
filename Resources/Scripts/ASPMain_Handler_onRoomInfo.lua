--------------------------------------------------------------------------------
--  Handler.......... : onRoomInfo
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onRoomInfo (  )
--------------------------------------------------------------------------------
	
	--get windowstate
    local hUser = application.getCurrentUser ( )
    
    --get component handler
    local hComponent = hud.getComponent ( hUser, "controls.RoomInfo"  )
    local hComponentBtn = hud.getComponent ( hUser, "controls.RoomInfoBtn"  )

    
    --check if target is visible
    local bIsVisible = hud.isComponentVisible ( hComponent )
    
    if bIsVisible == true then
    log.message ( "Target is visible" )
    
    hud.callAction ( hUser, "controls.RoomInfoHide" )
    
    
    else
    log.message ( "Target is not visible" )
    
    hud.callAction ( hUser, "controls.RoomInfoShow" )

    end
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
