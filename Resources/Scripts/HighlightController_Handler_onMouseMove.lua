--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    if ( this.isEnabled ( ) ) then
    
        if ( this.hHighlightedObject ( ) ~= nil ) then
            object.sendEvent ( this.hHighlightedObject ( ), "HighlightObjectAI", "onHighlight", false )
            this.hHighlightedObject ( nil )
        end
        
        local hHitObject, nHitDist, nHitSensorID = scene.getFirstHitSensor ( application.getCurrentUserScene ( ),  nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
        
        local hHighlightableObject = this.getHighlightableObject( hHitObject )
        if ( hHighlightableObject ~= nil ) then
            object.sendEvent ( hHighlightableObject, "HighlightObjectAI", "onHighlight", true )
            this.hHighlightedObject ( hHighlightableObject )
        end
        
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
