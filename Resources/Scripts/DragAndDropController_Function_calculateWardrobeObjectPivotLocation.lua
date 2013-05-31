--------------------------------------------------------------------------------
--  Function......... : calculateWardrobeObjectPivotLocation
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.calculateWardrobeObjectPivotLocation ( hObject )
--------------------------------------------------------------------------------

    local minx, miny, minz, maxx, maxy, maxz = this.calculateObjectBounds ( hObject )

    this.objectWidth ( math.abs ( maxx - minx ) )
    this.objectHeight ( math.abs ( maxy - miny ) )
    this.objectDepth ( math.abs ( maxz- minz ) )
        
    local x, y, z
    
    x = minx + ( (maxx - minx) * 0.5 )
    y = 0
    z = minz + ( (maxz- minz) * 0.5 )
        
    return x, y, z
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
