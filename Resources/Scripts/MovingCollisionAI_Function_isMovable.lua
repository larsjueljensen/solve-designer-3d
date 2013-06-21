--------------------------------------------------------------------------------
--  Function......... : isMovable
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingCollisionAI.isMovable ( hObject )
--------------------------------------------------------------------------------

    if ( hObject ~= nil ) then
        return sensor.getCategoryBitAt ( hObject, 0, this.kSensorCategoryBitMovable ( ) )
    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
