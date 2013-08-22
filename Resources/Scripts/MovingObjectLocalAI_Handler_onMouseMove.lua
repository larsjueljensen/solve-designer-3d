--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectLocalAI.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------


    local hScene = application.getCurrentUserScene ( )
    local hCollider, nHitDist, nHitSurfaceID, cx ,cy ,cz, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )   

    if ( hCollider ~= nil ) then
    
        local hScene = application.getCurrentUserScene ( )
        local hHitObject = scene.getFirstHitSensorWithID ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000, 4 )
        
        if ( hHitObject ~= nil ) then
            
            local hNewParent = this.getTopmostWardrobeObject ( hHitObject )            
            if (hNewParent ~= nil and this.canConnectWardrobeObjects ( hNewParent, object.getChildAt ( this.getObject ( ), 0 ) ) ) then
                object.setParent ( this.getObject ( ), hNewParent, true )
            end
        end
        
        
        local hParent = object.getParent ( this.getObject ( ) )
        
        if (hParent ~= nil) then
            
            local x, y, z = object.getTranslation ( hParent, object.kGlobalSpace )
            
            local parentHeight = object.getAIVariable ( hParent, "CommonObjectProperties", "objectHeight" )
            local dragObjectHeight = this.objectHeight ( )
            
            if ( cy > parentHeight - dragObjectHeight ) then
                cy =  parentHeight - dragObjectHeight
            end
            
            if ( cy < 0.875 ) then
                cy = 0.875
            end

            object.setTranslation ( this.getObject ( ), x, cy, z, object.kGlobalSpace )
            
        end
        
	end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
