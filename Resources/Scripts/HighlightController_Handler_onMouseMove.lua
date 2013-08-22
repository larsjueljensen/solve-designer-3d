--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    if ( this.isEnabled ( ) ) then

        if ( hud.getUnderCursorComponent ( this.getUser ( ) ) == nil ) then

            this.turnPreviousHighlightOff();
            
            local hHitObject, nHitDist, nHitSensorID = scene.getFirstHitSensor ( application.getCurrentUserScene ( ),  nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
            this.highlightObject ( this.getHighlightableObject( hHitObject ), true )

        end
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
