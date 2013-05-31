--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if ( this.hDragObject ( ) ~= nil ) then

        local hScene = application.getCurrentUserScene ( )
        local hCollider, nHitDist, nHitSurfaceID, x ,y ,z, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )   

        if ( hCollider ~= nil ) then
            object.setVisible ( this.hDragObject ( ), true )
            this.rotateDragObjectToMatchWall ( this.hDragObject ( ), hCollider )
            this.translateDragObjectToMatchWall ( this.hDragObject ( ), hCollider, x, y, z )
        end

    end 
        
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
