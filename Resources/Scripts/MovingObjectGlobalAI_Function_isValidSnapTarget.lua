--------------------------------------------------------------------------------
--  Function......... : isValidSnapTarget
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.isValidSnapTarget ( hObject )
--------------------------------------------------------------------------------

    return not this.isMoving ( hObject )
		
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------