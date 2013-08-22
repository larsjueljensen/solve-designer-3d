--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if (nButton == this.kLeftButton () ) then
        if ( hud.getUnderCursorComponent ( this.getUser ( ) ) == nil ) then

            local hHitObject, nHitDist, nHitSensorID = scene.getFirstHitSensor ( application.getCurrentUserScene ( ),  nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
            this.selectObject( this.getHighlightableObject ( hHitObject ) )

        end
    end    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
