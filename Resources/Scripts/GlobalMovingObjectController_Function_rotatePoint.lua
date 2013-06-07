--------------------------------------------------------------------------------
--  Function......... : rotatePoint
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.rotatePoint ( x, z, angle )
--------------------------------------------------------------------------------
	
    local currentAngle = math.acos ( x )
    
    if ( z < 0 ) then
        currentAngle = - currentAngle
    end
    
    local newX = math.cos ( currentAngle ) * math.cos ( angle ) - math.sin ( currentAngle ) * math.sin( angle )
    local newZ = math.sin ( currentAngle ) * math.cos ( angle ) + math.cos ( currentAngle ) * math.sin( angle )

    return newX, newZ    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
