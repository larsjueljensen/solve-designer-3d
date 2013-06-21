--------------------------------------------------------------------------------
--  Function......... : calculateVectorFromSnapObjectToSnapPosition
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.calculateVectorFromSnapObjectToSnapPosition ( dx, dy, dz, length )
--------------------------------------------------------------------------------

    local x, y, z = math.abs ( dx ), math.abs ( dy ), math.abs ( dz )

    if ( x > y and x > z ) then
        x = dx / x * length
        return x, 0, 0
    end
    
    if ( y > x and y > z ) then
        y = dy / y * length
        return 0, y, 0
    end
    
    if ( z > x and z > y ) then
        z = dz / z * length
        return 0, 0, z
    end
    
    x = dx / x * length
    return x, 0, 0
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
