--------------------------------------------------------------------------------
--  Function......... : calculateMeshBounds
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.calculateMeshBounds ( hMesh, hObject )
--------------------------------------------------------------------------------

    local minx, miny, minz = 10000, 10000, 10000
    local maxx, maxy, maxz = -10000, -10000, -10000


    for subsetIndex = 0, mesh.getSubsetCount ( hMesh ) - 1 do

        mesh.lockSubsetVertexBuffer ( hMesh, subsetIndex, mesh.kLockModeRead )

        for vertexIndex = 0, mesh.getSubsetVertexCount ( hMesh, subsetIndex ) - 1 do
            
            local tx, ty, tz = mesh.getSubsetVertexPosition ( hMesh, subsetIndex, vertexIndex )
            local x, y, z = object.transformPoint ( hObject, tx, ty, tz, object.kLocalSpace, object.kGlobalSpace )

            minx = math.min ( minx, x )
            miny = math.min ( miny, y )
            minz = math.min ( minz, z )
            
            maxx = math.max ( maxx, x )
            maxy = math.max ( maxy, y )
            maxz = math.max ( maxz, z )
            
        end
        
        mesh.unlockSubsetVertexBuffer ( hMesh, subsetIndex )

    end
    
    
    return minx, miny, minz, maxx, maxy, maxz
    	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
