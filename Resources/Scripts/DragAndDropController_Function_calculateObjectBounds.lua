--------------------------------------------------------------------------------
--  Function......... : calculateObjectBounds
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.calculateObjectBounds ( hObject )
--------------------------------------------------------------------------------
	
    local minx, miny, minz, maxx, maxy, maxz = 10000, 10000, 10000, -10000, -10000, -10000

    local hMesh = shape.getMesh ( hObject )
    
    if ( ( hMesh ~= nil ) and ( object.isVisible ( hObject ) ) ) then

        minx, miny, minz, maxx, maxy, maxz = this.calculateMeshBounds ( hMesh, hObject )

    end
    
    for i = 0, object.getChildCount ( hObject ) - 1 do
        
        local cminx, cminy, cminz, cmaxx, cmaxy, cmaxz = this.calculateObjectBounds ( object.getChildAt ( hObject, i ) )
        
        minx = math.min ( minx, cminx )
        miny = math.min ( miny, cminy )
        minz = math.min ( minz, cminz )
        
        maxx = math.max ( maxx, cmaxx )
        maxy = math.max ( maxy, cmaxy )
        maxz = math.max ( maxz, cmaxz )
    end
    
    return minx, miny, minz, maxx, maxy, maxz
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
