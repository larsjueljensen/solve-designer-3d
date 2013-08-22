--------------------------------------------------------------------------------
--  Handler.......... : onMouseMoveLocal
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.onMouseMoveLocal ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    local hScene = application.getCurrentUserScene ( )
    local hCollider, nHitDist, nHitSurfaceID, x ,y ,z, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )   

    if ( hCollider ~= nil ) then
        local hScene = application.getCurrentUserScene ( )
        local hHitObject = scene.getFirstHitSensorWithID ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000, this.kSensorMovable ( ) )
        
        if ( hHitObject ~= nil ) then
            
            local hNewParent = this.getWardrobeObject ( hHitObject )
            
            if ( hNewParent ~= nil and not object.isEqualTo ( hNewParent, this.hDragObject ( ) )) then
                if ( this.canConnectWardrobeObjects ( hNewParent, this.hDragObject ( ) ) ) then
                    object.setParent ( this.hDragObject ( ), hNewParent, true )
                    object.setVisible ( this.hDragObject ( ), true )
                end
            end

        end

        if (this.hasWardrobeObjectParent ( this.hDragObject ( ) )) then
            
            object.setVisible ( this.hDragObject ( ), true )
            this.translateDragObjectToMatchParent( this.hDragObject ( ), y )
            
        else

            object.setVisible ( this.hDragObject ( ), false )                    

        end

	end
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
