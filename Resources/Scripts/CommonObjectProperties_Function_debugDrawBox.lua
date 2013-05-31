--------------------------------------------------------------------------------
--  Function......... : debugDrawBox
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CommonObjectProperties.debugDrawBox ( minx, miny, minz, maxx, maxy, maxz, r, g, b, a )
--------------------------------------------------------------------------------
	
    debug.drawLine ( minx, miny, maxz, maxx, miny, maxz, r, g, b, a )
    debug.drawLine ( minx, maxy, maxz, maxx, maxy, maxz, r, g, b, a )
    debug.drawLine ( minx, maxy, minz, maxx, maxy, minz, r, g, b, a )
    debug.drawLine ( minx, miny, minz, maxx, miny, minz, r, g, b, a )
    
    debug.drawLine ( minx, miny, maxz, minx, maxy, maxz, r, g, b, a )
    debug.drawLine ( maxx, miny, maxz, maxx, maxy, maxz, r, g, b, a )
    debug.drawLine ( maxx, miny, minz, maxx, maxy, minz, r, g, b, a )
    debug.drawLine ( minx, miny, minz, minx, maxy, minz, r, g, b, a )
    
    debug.drawLine ( minx, miny, maxz, minx, miny, minz, r, g, b, a )
    debug.drawLine ( maxx, miny, maxz, maxx, miny, minz, r, g, b, a )
    debug.drawLine ( maxx, maxy, maxz, maxx, maxy, minz, r, g, b, a )
    debug.drawLine ( minx, maxy, maxz, minx, maxy, minz, r, g, b, a )    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
