--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollisionBegin
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.onSensorCollisionBegin ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
	
    --log.message ( "In ObjectAI.onSensorCollision" )
    
    
    
-- 	local hUser = application.getCurrentUser()
--     local hScene = application.getCurrentUserScene ( )
--     --local bState = this.bIsMovingObject ( )
--     local hNewObject = user.getAIVariable ( hUser ,"MovingObject", "hMovingObject")
--     local hCursorX = user.getAIVariable ( hUser ,"MovingObject", "nOffsetX")
--     
--     --log.message ( "SENSORCOLL:", hTargetObject )
--     local hParent = object.getParent ( hTargetObject )
--     --log.message ( "SENSORCOLL:", hParent )
--     
--     if hParent then
--     local hSuperParent = object.getParent ( hParent )
--     --log.message ( "SENSORCOLL:", hSuperParent )
--     end
--     
--     local sTargetTag = scene.getObjectTag ( hScene, hTargetObject )
--     local hObj = this.getObject ( )
--     local bStatic = sensor.getCategoryBitAt(  hTargetObject, 0 , 1 )
--     local bIsNewObject
--     this.hTargetObject( object.getParent ( hTargetObject ) )
--     
--     local hParentA = object.getParent ( hTargetObject )
--     
--  
--     
--     if hNewObject ~= nil  then
--     local hParentB = object.getParent ( hObj )
--     bIsNewObject = object.isEqualTo( hObj, hTargetObject )
--     end
--     
--     --log.message ( "In ObjectAI.onSensorCollisionBegin_bIsNewObject = ", bIsNewObject )
--     
--     
--     
--     if bIsNewObject 
--     then
--         if bStatic then
--         else
--             if sensor.getCategoryBitAt ( hNewObject, 0, 1 ) == false then
--             --log.message ( "SENSORCOLLISSION: hTargetObject = ", hTargetObject )
--             --log.message ( "SENSORCOLLISSION: this_Object = ", hObj )
--             --log.message ( "SENSORCOLLISSION: hNewObject = ", hNewObject )
--             
--             this.PlaceNewObject ( nSensorID, hTargetObject, nTargetSensorID  )
--                 --Compare sensor hot.
--                 --
--                 local bIsSame = object.isEqualTo ( object.getParent ( hTargetObject ), object.getParent ( hObj ) )
--                 
-- --                 log.message ( "hParentA = ", hParentA )
-- --                 log.message ( "hParentB = ", hParentB )
-- -- 
--             else
--             end
--         
-- 
--         end
--     else
--     end
-- 
-- 
-- 
--     if bIsNewObject 
--         then
--         if sensor.getCategoryBitAt ( hTargetObject, 0, 2 ) == true then --Target object is wall 
--         this.PlaceNewObject ( nSensorID, hTargetObject, nTargetSensorID  )
--         end
-- --         log.message ( "Hello" )
-- --         log.message ( "In ObjectAI_onSensorCollisionBegin" )
-- --         log.message ( "this_getObject = ", hObj )
-- --         log.message ( "hNewObject = ",hNewObject )
-- --         log.message (" ", nSensorID," ", hTargetObject," ", nTargetSensorID  )
-- --         
--         
--         
--         
--     else
--         --log.message ( "TEST SENSORS" )
--         --log.message ( this.hMovingObject ( ) )
-- 
--     -- do stuff
--     end
--    
-- 


    
    
    
    
    
    
    
    
   
   
    
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
