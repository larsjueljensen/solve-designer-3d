--------------------------------------------------------------------------------
--  Function......... : ShowDialogWnd
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.ShowDialogWnd ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local hToolWnd = hud.getComponent ( hUser, "HUD_sidemenu.ToolsMain" )
    local hRoomEdit = hud.getComponent ( hUser, "HUD_sidemenu.RoomEditor" )
    local hObjectEdit = hud.getComponent ( hUser, "HUD_sidemenu.ObjectEditor" )
    local hSlider = hud.getComponent ( hUser, "Slider" )
    
    local hLastObject = user.getAIVariable ( hUser, "MovingObject", "hLastObject" )
    local hSelectedObject = user.getAIVariable ( hUser, "MovingObject", "hSelectedObject" )

    if hLastObject  then
    
        local nType = sensor.getCategoryBitAt ( hLastObject , 0, 1 )

        if nType then
        else

            hud.setComponentVisible ( hToolWnd, true )
            hud.setComponentVisible ( hRoomEdit, false )
            hud.setComponentVisible ( hObjectEdit, true )

            hSelectedObject = hLastObject  
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
