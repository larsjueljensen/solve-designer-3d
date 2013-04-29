--------------------------------------------------------------------------------
--  Function......... : UpdateStatus
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.UpdateStatus ( hObject )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser ( )
    
    log.message ( "UPDATE: ", hUser )
    --local sText = scene.getObjectTag ( application.getCurrentUserScene ( ), hObject )
	--local hLabel = hud.getComponent( hUser, "controls.Label2" )
    
    --log.message( "Got label ", hLabel )
    
    
    
    --set text
    
    --hud.setLabelText ( hLabel, sText )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
