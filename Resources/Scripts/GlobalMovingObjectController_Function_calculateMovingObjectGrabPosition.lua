--------------------------------------------------------------------------------
--  Function......... : calculateMovingObjectGrabPosition
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.calculateMovingObjectGrabPosition ( hObject, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local minx, miny, minz, maxx, maxy, maxz = this.getBoundingBox ( hObject )    
    local rdirx, rdiry, rdirz = math.vectorNormalize ( nRayDirX, 0, nRayDirZ )
    
    local ax, az = this.find2DVectorIntersectionPoint ( nRayPntX, nRayPntZ, rdirx, rdirz, minx, minz, 1, 0 )
    local bx, bz = this.find2DVectorIntersectionPoint ( nRayPntX, nRayPntZ, rdirx, rdirz, minx, maxz, 1, 0 )
    local cx, cz = this.find2DVectorIntersectionPoint ( nRayPntX, nRayPntZ, rdirx, rdirz, minx, minz, 0, 1 )
    local dx, dz = this.find2DVectorIntersectionPoint ( nRayPntX, nRayPntZ, rdirx, rdirz, maxx, minz, 0, 1 )

    local x, z = this.getShortestVector ( ax, az, 0, 0 )
    x, z = this.getShortestVector ( bx, bz, x, z )
    x, z = this.getShortestVector ( cx, cz, x, z )
    x, z = this.getShortestVector ( dx, dz, x, z )
    
    return x, 0, z

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
