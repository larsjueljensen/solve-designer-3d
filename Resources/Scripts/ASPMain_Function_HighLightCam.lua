--------------------------------------------------------------------------------
--  Function......... : HighLightCam
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.HighLightCam ( )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser ( )
    
    local nButton = hud.getUnderCursorComponent ( hUser )
    local nOn = hud.getComponent ( hUser, "controls.ButtonOn_2" )
    
    --log.message ( "User clicked: ", nButton  )
    
    if nButton then
    hud.matchComponentScreenSpaceCenter ( nOn, nButton  )
    hud.setComponentVisible ( nOn, true )
    else
    --do nada
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
