--------------------------------------------------------------------------------
--  Function......... : getBoundingBoxFromPos
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.getBoundingBoxFromPos ( hObject, x, y, z, space )
--------------------------------------------------------------------------------

    local xx, xy, xz = object.getXAxis ( hObject, space )
    local yx, yy, yz = object.getYAxis ( hObject, space )
    local zx, zy, zz = object.getZAxis ( hObject, space )
    
    local w = math.vectorDotProduct ( this.objectWidth ( ), this.objectHeight ( ), this.objectDepth ( ), xx, xy, xz )
    local h = math.vectorDotProduct ( this.objectWidth ( ), this.objectHeight ( ), this.objectDepth ( ), yx, yy, yz )
    local d = math.vectorDotProduct ( this.objectWidth ( ), this.objectHeight ( ), this.objectDepth ( ), zx, zy, zz )
    
    local deltaX = 0.5 * w
    local deltaY = h
    local deltaZ = 0.5 * d
    
    local minx = x - deltaX
    local miny = y
    local minz = z - deltaZ
    
    local maxx = x + deltaX
    local maxy = y + deltaY
    local maxz = z + deltaZ
            
    return math.min ( minx, maxx ), math.min ( miny, maxy ), math.min ( minz, maxz ), math.max ( minx, maxx ), math.max ( miny, maxy) , math.max ( minz, maxz )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
