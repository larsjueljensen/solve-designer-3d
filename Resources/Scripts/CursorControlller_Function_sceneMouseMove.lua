--------------------------------------------------------------------------------
--  Function......... : sceneMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.sceneMouseMove ( hScene,  nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor ( hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
    
    if hHitObject then
        local hUser = this.getUser ( )
        local nBoundingXmin, nBoundingYmin, nBoundingZmin = object.getBoundingBoxMin ( hHitObject )
        local nBoundingXmax, nBoundingYmax, nBoundingZmax = object.getBoundingBoxMin ( hHitObject )
        
        local bSensorType = sensor.getCategoryBitAt ( hHitObject, 0 , 4 )
        local bSensorTypeAddon = sensor.getCategoryBitAt ( hHitObject, 0 , 5 )

        if bSensorType == true then

            this.CursorState ( 4 )
        
            if bSensorTypeAddon == true then
                --user.sendEvent ( hUser , "MovingObject", "onHighlightObject", hHitObject, hHitObject, 0 )
            else
                local hTopNode = this.GetTopNode ( hHitObject )
                this.TopNode ( hTopNode )
                --user.sendEvent ( hUser, "MovingObject", "onHighlightObject", hHitObject, hTopNode, 0 )  
            end
            
        else 
            hTopNode = hHitObject
            --user.sendEventImmediate ( hUser, "MovingObject", "onHighlightObject", hHitObject, hTopNode, 1 )
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
