--------------------------------------------------------------------------------
--  Function......... : getShortestVector
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.getShortestVector ( ax, ay, bx, by )
--------------------------------------------------------------------------------
	
    local lenA = math.vectorLength ( ax, ay )
    local lenB = math.vectorLength ( bx, by )
    
    if ((lenA == 0) or (lenB < lenA)) then
        return bx, by
    end
    
    if ((lenB == 0) or (lenA < lenB) then
        return ax, ay
    end
    
    return ax, ay
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
