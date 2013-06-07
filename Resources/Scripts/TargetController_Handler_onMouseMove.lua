--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function TargetController.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    local hScene = application.getCurrentUserScene ( )
    local hCollider, nHitDist, nHitSurfaceID, x ,y ,z, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )
    
    if ( hCollider ~= nil ) then
    
        local hTarget = scene.getTaggedObject ( hScene, "target" )   
        local sColliderTag = scene.getObjectTag ( hScene, hCollider )
        local xW, yW, zW = object.getTranslation( scene.getTaggedObject ( hScene, sColliderTag ), object.kGlobalSpace )

        -- If we hit the wall initally in front
        if ( string.contains ( sColliderTag, "Wall1" ) ) then
        
                object.setRotation ( hTarget, 90, 0, 0 , object.kGlobalSpace )
                object.setTranslation ( hTarget, x , y, zW + 1, object.kGlobalSpace )
        
        -- If we hit the wall initally behind
        elseif ( string.contains ( sColliderTag, "Wall2" ) ) then

                object.setRotation ( hTarget, 90, 0, 180 , object.kGlobalSpace )
                object.setTranslation ( hTarget, x, y, zW - 1, object.kGlobalSpace )

        -- If we hit the wall initally to the right
        elseif ( string.contains ( sColliderTag, "Wall3" ) ) then

                object.setRotation ( hTarget, 90, 0, 90 , object.kGlobalSpace )
                object.setTranslation ( hTarget, xW - 1, y, z, object.kGlobalSpace )

        -- If we hit the wall initally to the left    
        elseif ( string.contains ( sColliderTag, "Wall4" ) ) then

                object.setRotation ( hTarget, 90, 0, -90 , object.kGlobalSpace )
                object.setTranslation ( hTarget, xW + 1 , y, z, object.kGlobalSpace )
        
        end
        
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
