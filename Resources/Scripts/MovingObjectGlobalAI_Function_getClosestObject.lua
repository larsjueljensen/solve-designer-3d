--------------------------------------------------------------------------------
--  Function......... : getClosestObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.getClosestObject ( hObjectA, hObjectB, x, y, z, space )
--------------------------------------------------------------------------------

    local distanceA = this.getDistanceToObject ( hObjectA, x, y, z, space )
    local distanceB = this.getDistanceToObject ( hObjectB, x, y, z, space )
    
    if (distanceA <= distanceB) then
        return hObjectA
    end
    
    return hObjectB

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
