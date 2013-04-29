--------------------------------------------------------------------------------
--  Function......... : ObjectDeselected
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.ObjectDeselected ( )
--------------------------------------------------------------------------------
	
	--user.sendEvent ( this.getUser ( ), "aspmenu_AI", "onHideSelectionIcon" )
	
    log.message ( "Object deselected" )
    
    local hObject = user.getAIVariable ( application.getCurrentUser ( ), "MovingObject", "hPreviousObject" )
    
    log.message ( "Object deselected ", hObject )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
