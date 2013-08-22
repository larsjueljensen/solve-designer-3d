--------------------------------------------------------------------------------
--  Function......... : swapObjectsPosition
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.swapObjectsPosition ( hObjectA, hObjectB, space )
--------------------------------------------------------------------------------

    local nWidthA = this.objectWidth ( )
    local nWidthB = object.getAIVariable ( hObjectB, "CommonObjectProperties", "objectWidth" )
            
    local ax, ay, az = object.getTranslation ( hObjectA, space )
    local bx, by, bz = object.getTranslation ( hObjectB, space )
    
    -- Get a vector going from B to A (A <- B)
    local vAx, vAy, vAz, vAlength = this.calculateVectorAndDistanceToObject ( ax, ay, az, hObjectB, space )
    vAx, vAy, vAz = this.restrictVectorToAxisAndLength ( vAx, vAy, vAz, vAlength )
    
    -- Create a new vector in same direction with magnitude of half the width of A
    local vBx, vBy, vBz = math.vectorNormalize ( vAx, vAy, vAz )
    vBx, vBy, vBz = math.vectorScale ( vBx, vBy, vBz, nWidthA * 0.5 )
    
    -- Create a new vector in same direction with magnitude of half the width of B
    local vCx, vCy, vCz = math.vectorNormalize ( vAx, vAy, vAz )
    vCx, vCy, vCz = math.vectorScale ( vCx, vCy, vCz, nWidthB * 0.5 )
    
    -- Calculate the position of the far side of B
    local rx, ry, rz = bx - vCx, by - vCy, bz - vCz

    -- Calculate the new position for A and B
    local pax, pay, paz = rx + vBx, ry + vBy, rz + vBz
    local pbx, pby, pbz = pax + vAx, pay + vAy, paz + vAz

    object.setTranslation ( hObjectA, pax, pay, paz, space )
    object.setTranslation ( hObjectB, pbx, pby, pbz, space )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
