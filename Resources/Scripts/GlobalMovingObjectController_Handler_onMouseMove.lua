--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : Lars Juel Jensen
--  Description...... : Dispatch the mouse move events to the moving object helper if such a helper exists
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    -- If a temporary moving object helper exists
    if ( this.hMovingObject ( ) ~= nil ) then
        
        local dx, dy, dz = this.calculateCorrectedRayCastVector( nRayDirX, nRayDirY, nRayDirZ )

        -- Call the correct ai model (Global or Local) of the moving object helper
        if ( object.hasAIModel ( this.hMovingObject ( ), "MovingObjectGlobalAI" ) ) then
            object.sendEvent ( this.hMovingObject ( ), "MovingObjectGlobalAI", "onMouseMove", nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, dx, dy, dz )
        elseif ( object.hasAIModel ( this.hMovingObject ( ), "MovingObjectLocalAI" ) ) then
            object.sendEvent ( this.hMovingObject ( ), "MovingObjectLocalAI", "onMouseMove", nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, dx, dy, dz )
        end
        
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
