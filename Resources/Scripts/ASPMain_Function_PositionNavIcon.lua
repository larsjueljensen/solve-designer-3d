--------------------------------------------------------------------------------
--  Function......... : PositionNavIcon
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.PositionNavIcon ( )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser ( )
    
    --get selected object translation
    
    local hObject = user.getAIVariable ( hUser, "MovingObject", "hMovingObject" )
    
    log.message ( "In Position nav icon: hObject = ", hObject )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
