--------------------------------------------------------------------------------
--  Handler.......... : onMouseMoveFront
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.onMouseMoveFront ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hCollider, nHitDist, nHitSurfaceID, x ,y ,z, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )   

    if ( hCollider ~= nil ) then
        
	end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
