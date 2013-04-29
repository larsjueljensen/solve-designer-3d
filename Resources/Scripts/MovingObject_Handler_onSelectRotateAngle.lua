--------------------------------------------------------------------------------
--  Handler.......... : onSelectRotateAngle
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onSelectRotateAngle (  )
--------------------------------------------------------------------------------
	
	local hButton = hud.getUnderCursorComponent ( this.getUser ( ) )
    local sAngle = hud.getButtonText ( hButton )
    
    local nAngle = string.toNumber ( sAngle )
    local hUser = application.getCurrentUser ( )
    
    local hButton45 = hud.getComponent ( hUser, "HUD_sidemenu.Btn_Rotate_Label45"  )
    local hButton90 = hud.getComponent ( hUser, "HUD_sidemenu.Btn_Rotate_Label90"  )
    local hButton180 = hud.getComponent ( hUser, "HUD_sidemenu.Btn_Rotate_Label180"  )

    --set btn highlight
    log.message ( "Got hud component button under cursor :", hButton )
    log.message ( "Got hud component button 45 :", hButton45 )
    log.message ( "Got hud component button 90 :", hButton90 )
    log.message ( "Got hud component button 180 :", hButton180 )
    
    --get text from button
    
    
   
   
    
    

    
    if nAngle == 45 then
    hud.setComponentForegroundColor ( hButton45, 0, 65, 127,255  )
    hud.setComponentForegroundColor ( hButton90, 127, 127, 127,255  )
    hud.setComponentForegroundColor ( hButton180, 127, 127, 127,255  )
    elseif nAngle == 90 then
    hud.setComponentForegroundColor ( hButton45, 127, 127, 127,255  )
    hud.setComponentForegroundColor ( hButton90, 0, 65, 127,255  )
    hud.setComponentForegroundColor ( hButton180, 127, 127, 127,255  )
    elseif nAngle == 180 then
    hud.setComponentForegroundColor ( hButton45, 127, 127, 127,255  )
    hud.setComponentForegroundColor ( hButton180, 0, 65, 127,255  )
    hud.setComponentForegroundColor ( hButton90, 127, 127, 127,255  )

    else
    log.message ( "nAngle = :", sAngle )
    end
   
    
    this.nStepAngle ( nAngle )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
