--------------------------------------------------------------------------------
--  Function......... : isMovable
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.isMovable ( hObject )
--------------------------------------------------------------------------------

    return sensor.getCategoryBitAt ( hObject, 0, this.kSensorCategoryBitMovable ( ) )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
