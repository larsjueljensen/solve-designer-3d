--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : Lars Juel Jensen
--  Description...... : Moves the moving object helper around the scene
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hCollider, nHitDist, nHitSurfaceID, cx ,cy ,cz, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )   
    this.rotateObjectToMatchWall ( this.getObject ( ), hCollider )
    this.translateObjectToMatchWall ( this.getObject ( ), hCollider, cx, cy, cz )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
