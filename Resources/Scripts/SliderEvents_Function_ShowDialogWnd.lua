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
    local hSelectedObject = user.getAIVariable ( hUser, "MovingObject", "hSelectedObject" )    --log.message ( "DoubleTap: ", hLastObject ( ))
  
   
        --hud.setComponentVisible ( hTools, true )
--TODO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    if hLastObject  then
    local nType = sensor.getCategoryBitAt ( hLastObject , 0, 1 )
        if nType then
        
            --log.message ( "Room editor selected" )
--             hud.setComponentVisible ( hToolWnd, true )
--             hud.setComponentVisible ( hRoomEdit, true )
--             hud.setComponentVisible ( hObjectEdit, false )
--             
--             hud.callAction ( application.getCurrentUser ( ), "controls.HideMenuBar" )
--         
        else
        
            
            hud.setComponentVisible ( hToolWnd, true )
            hud.setComponentVisible ( hRoomEdit, false )
            hud.setComponentVisible ( hObjectEdit, true )

            hSelectedObject = hLastObject  
            log.message ( "Object editor selected for mod: ", hSelectedObject  )
        --object.sendEvent ( hNewSlider, "Slider", "onSetTargetObject", hObj ) 
           
           --this.HighLightObject ( )
            --shape.setMeshOpacity ( this.hSelectedObject ( ), nOpacity )
            log.message ( "Object editor selected for mod: ", hSelectedObject )
            
        end
        else
        -- do stuff
    end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
