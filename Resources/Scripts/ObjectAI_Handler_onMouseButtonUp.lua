--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

--log.message ( "In onMouseButtonUp", this.hMovingObject ( ) )


-- 	 if ( this.hMovingObject ( ) )
--        then
-- 	local hObject, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 100 )
--         if ( hObject )
--         then
--             if nButton == 0 then
--             object.setTranslation ( this.hMovingObject ( ), x, y, z, object.kGlobalSpace )
--             else end
--             
--             this.hMovingObject ( nil )
--             
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.SelectCollider" ), false )
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.PickObject" ), true )
-- 	end
--      
-- end

--user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onDeselect" )
user.setAIVariable ( this.getUser ( ), "MovingObject", "hMovingObject", false )
--user.setAIVariable ( hUser, sAIModel, sVariable, vValue )
this.hMovingObject(nil)
this.bIsMovingObject ( false )
-- if 
-- this.bOnOverlap (  )== false
-- then
--     
-- else
-- end
-- 



-- local hObject = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 100 )
--         if ( hObject )
--         then
--             this.hMovingObject ( hObject )
--             
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObject.SelectCollider" ), true )
--             hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObject.PickObject" ), false )
--         end 	
-- -------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
