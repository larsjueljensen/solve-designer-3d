--------------------------------------------------------------------------------
--  Function......... : highlightObjectUnderCursor
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.highlightObjectUnderCursor ( nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
        local hHitObject, nHitDist, nHitSensorID = scene.getFirstHitSensorWithID ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000, this.kSensorCategoryBitMovable ( ) )
        local hWardrobeComponent = this.getWardrobeOrWardrobeGroup ( hHitObject )
        
        if ( hWardrobeComponent ~= nil ) then
            object.sendEvent ( hWardrobeComponent, "HighlightObjectAI", "onHighlight", true )
        end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
