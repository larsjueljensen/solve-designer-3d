--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : Lars Juel Jensen
--  Description...... : Creates a global or local moving object helper
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    -- If the left mouse button was pressed
    if ( nButton == this.kLeftButton ( ) ) then
    
        -- Get the first object with a sensor that is found using ray casting (ie. first sensor hit with mouse cursor)
        local hHitObject, nHitDist, nHitSensorID = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )
        
        -- If that object exists and has a sensor that defines the object as movable
        if this.isHitObjectMovable( hHitObject ) then

            local sType = this.createGlobalOrLocalMovingObject ( hHitObject )
            
--             if ( string.compare ( "Global", sType ) == 0 ) then
--                 this.calculateRayCastCorrAngle ( this.hMovingObject ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--             end

            this.calculateMovingObjectGrabPosition ( this.hMovingObject ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )

        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------