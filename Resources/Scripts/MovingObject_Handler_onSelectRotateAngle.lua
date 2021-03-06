--------------------------------------------------------------------------------
--  Handler.......... : onSelectRotateAngle
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onSelectRotateAngle (  )
--------------------------------------------------------------------------------
	    
    local nAngle = string.toNumber ( hud.getButtonText ( hud.getUnderCursorComponent ( this.getUser ( ) ) ) )
    local hUser = application.getCurrentUser ( )
    
    local hButton45 = hud.getComponent ( hUser, "HUD_sidemenu.Btn_Rotate_Label45"  )
    local hButton90 = hud.getComponent ( hUser, "HUD_sidemenu.Btn_Rotate_Label90"  )
    local hButton180 = hud.getComponent ( hUser, "HUD_sidemenu.Btn_Rotate_Label180"  )

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
    end
   
    this.nStepAngle ( nAngle )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
