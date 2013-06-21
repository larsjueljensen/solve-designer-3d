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

    ax = math.roundToNearestInteger ( ax )
    ay = math.roundToNearestInteger ( ay )
    az = math.roundToNearestInteger ( az )
    bx = math.roundToNearestInteger ( bx )
    by = math.roundToNearestInteger ( by )
    bz = math.roundToNearestInteger ( bz )
        
    return ax == bx and ay == by and az == bz    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
