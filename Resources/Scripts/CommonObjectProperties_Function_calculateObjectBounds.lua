--------------------------------------------------------------------------------
--  Function......... : calculateObjectBounds
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CommonObjectProperties.calculateObjectBounds ( hObject )
--------------------------------------------------------------------------------

    local x, y, z = object.getTranslation ( hObject, object.kGlobalSpace )
	
    local xx, xy, xz = object.getXAxis ( hObject, object.kGlobalSpace )
    local yx, yy, yz = object.getYAxis ( hObject, object.kGlobalSpace )
    local zx, zy, zz = object.getZAxis ( hObject, object.kGlobalSpace )
    
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
        
    return minx, miny, minz, maxx, maxy, maxz
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
