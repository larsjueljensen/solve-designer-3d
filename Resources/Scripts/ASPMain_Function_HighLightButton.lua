--------------------------------------------------------------------------------
--  Function......... : HighLightButton
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.HighLightButton ( )
--------------------------------------------------------------------------------
		
    local hUser = application.getCurrentUser ( )
    local nButton = hud.getUnderCursorComponent ( hUser )
    local nOn = hud.getComponent ( hUser, "controls.ButtonOn" )
    
    this.ObjectDeselected ( )
    
    if nButton then
        hud.matchComponentScreenSpaceCenter ( nOn, nButton  )
        hud.setComponentVisible ( nOn, true )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
