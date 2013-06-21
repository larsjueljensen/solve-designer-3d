--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hCollider, nHitDist, nHitSurfaceID, cx ,cy ,cz, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )    
	
    local x, y, z = object.getTranslation ( this.getObject ( ), object.kGlobalSpace )
    
    -- Calculate the target vector that finds 
    --the object's position from the hit point on the wall    
    this.tx ( x - cx )
    this.ty ( y - cy )
    this.tz ( z - cz )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
