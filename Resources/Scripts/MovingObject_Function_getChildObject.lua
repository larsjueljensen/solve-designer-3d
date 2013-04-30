--------------------------------------------------------------------------------
--  Function......... : getChildObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.getChildObject ( hObject, nCount )
--------------------------------------------------------------------------------
	log.message ( "getChildObject" )
    
    log.message ( hObject )
	local nChildren = object.getChildCount ( hObject )
    
    if nChildren > 0 then
    
    user.postEvent ( this.getUser ( ), 0, "MovingObject", "onAddSensor"  )
    
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
