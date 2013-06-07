--------------------------------------------------------------------------------
--  Function......... : calculateCorrectedRayCastVector
--  Author........... : Lars Juel Jensen
--  Description...... : Called on mouse move to correct 
--                          movement according to user's grab position
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.calculateCorrectedRayCastVector ( dx, dy, dz )
--------------------------------------------------------------------------------

    local x, z, angle
    
    angle = this.correctionAngle ( )
    x, z = this.rotatePoint ( dx, dz, angle ) 
    
    if (angle > 0) then
        this.correctionAngle ( angle - 0.1 )
    else
        this.correctionAngle ( angle + 0.1 )
    end
    
    return x, dy, z
		
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
