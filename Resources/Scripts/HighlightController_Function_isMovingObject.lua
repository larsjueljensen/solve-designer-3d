--------------------------------------------------------------------------------
--  Function......... : isMovingObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.isMovingObject ( hObject )
--------------------------------------------------------------------------------
	
    if ( this.isHelperObject ( hObject, "MovingObjectGlobal" ) ) then
        return true
    end
	
    if ( this.isHelperObject ( hObject, "MovingObjectLocal" ) ) then
        return true
    end
	
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
