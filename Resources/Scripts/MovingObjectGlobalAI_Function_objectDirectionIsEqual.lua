--------------------------------------------------------------------------------
--  Function......... : objectDirectionIsEqual
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.objectDirectionIsEqual ( hObjectA, hObjectB )
--------------------------------------------------------------------------------

    local ax, ay, az = object.getDirection ( hObjectA, object.kGlobalSpace )
    local bx, by, bz = object.getDirection ( hObjectB, object.kGlobalSpace )
    
    return ax == bx and ay == by and az == bz    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
