--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function RuleMouseController.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
   local hHitObject, nHitDist, nHitSensorID = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )
    
    if this.isMovableObject( hHitObject )  then
        
        local hWardrobeObject = this.getParentWardrobeObject ( hHitObject )
        
        for i = 0, object.getAIModelCount ( ) - 1 do

            local sAIModel = object.getAIModelNameAt ( hWardrobeObject, i )

            if ( string.contains ( sAIModel, "Rule" ) ) then
                object.sendEvent ( hWardrobeObject, sAIModel, "onHandleMouseMove", nDeltaX, nDeltaY )
            end
        end
        
    end		
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
