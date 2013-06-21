--------------------------------------------------------------------------------
--  Function......... : keepObjectWithinWalls
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.keepObjectWithinWalls ( hObject, x, y, z, space )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local xlimit = user.getAIVariable ( hUser, "ASPMain", "RoomWidth" ) * 5 - 0.75
    local zlimit = user.getAIVariable ( hUser, "ASPMain", "RoomLength" ) * 5 - 0.75
    
    local resx, resy, resz = x, y, z
    local minx, miny, minz, maxx, maxy, maxz = this.getBoundingBoxFromPos ( hObject, x, y, z, space )
    
    if ( maxx > xlimit ) then
        resx = xlimit - (0.5 * ( maxx - minx ))
    end
    
    if ( minx < -xlimit ) then
        resx = -xlimit + (0.5 * ( maxx - minx ))
    end
    
    if ( maxz > zlimit ) then
        resz = zlimit - (0.5 * ( maxz - minz ))
    end
    
    if ( minz < -zlimit ) then
        resz = -zlimit + (0.5 * ( maxz - minz ))
    end
    
	return resx, resy, resz
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
