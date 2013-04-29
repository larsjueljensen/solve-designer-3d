--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
----------------------------------------------------------------------------------------





--********************************************************************************old code	
     local hObject = this.hMovingObject ( )
--     
     local nPosX, nPosY = hud.getCursorPosition ( this.getUser ( ) )
--     
--     local nTrgX = (nPosX/8)-10
--     local nTrgZ = (nPosY/-8)+10
--     
--     local nBtn = this.nButtonPressed ()
--     
--     
--     log.message ( "Selection: ", hObject )
--     log.message ( "Button = ", nBtn )
     --log.message ( "X coord = ", nPosX , "Y coord = ", nPosY)
--     
--     if (hObject)then
--     local hObject, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 100 )
--             
--             
--             if nBtn == 0 then
--             object.setTranslation ( this.hMovingObject ( ), x ,0.5 ,z , object.kGlobalSpace )
--             elseif nBtn == 1 then
--             y = x
--             object.setRotation( this.hMovingObject ( ), 0 ,y*100 ,0 , object.kGlobalSpace )
--             end
--     end
--     
--     if ( hObject )
--        then
--         local hObject, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 100 )
--         if ( hObject )
--         then 
--         
--         if nBtn == 0 then
--             object.setTranslation ( hObject, x, y, z, object.kGlobalSpace )
--         elseif nBtn == 1 then
--             object.setRotation ( hObject, 0, y, 0, object.kGlobalSpace )
--         end
--             this.hMovingObject ( nil )
--             
--             
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.SelectCollider" ), false )
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.PickObject" ), true )
--         end
--     else
-- --         local hObject = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 100 )
--         if ( hObject ~= nil )
--         then
--             this.hMovingObject ( hObject ) 
--             
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.SelectCollider" ), true )
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.PickObject" ), false )
-- --         end
--     end
--     
-- log.message ( this.getObject ( ) )
-- ------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
