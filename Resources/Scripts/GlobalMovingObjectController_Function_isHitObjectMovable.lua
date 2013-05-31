--------------------------------------------------------------------------------
--  Function......... : isHitObjectMovable
--  Author........... : Lars Juel Jensen
--  Description...... : Returns wether or not a hit object can be moved around
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.isHitObjectMovable ( hHitObject )
--------------------------------------------------------------------------------

    if ( hHitObject ~= nil ) then
        return sensor.getCategoryBitAt ( hHitObject, 0, this.kSensorCategoryBitMovable ( ) )
    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
