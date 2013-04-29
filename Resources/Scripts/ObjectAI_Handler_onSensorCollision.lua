--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollision
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.onSensorCollision ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
	

--     log.message ( "In ObjectAI.onSensorCollision" )
--     
--     
--     
-- 	local hUser = application.getCurrentUser()
--     local hScene = application.getCurrentUserScene ( )
--     local bState = this.bIsMovingObject ( )
--     local hNewObject = user.getAIVariable ( hUser ,"MovingObject", "hMovingObject")
--     local hCursorX = user.getAIVariable ( hUser ,"MovingObject", "nOffsetX")
--     local sTargetTag = scene.getObjectTag ( hScene, hTargetObject )
--     local hObj = this.getObject ( )
--     local bStatic = sensor.getCategoryBitAt(  hTargetObject, 0 , 1 )
--     local bIsNewObject
--     
--     
--     
--     
--     log.message ( "In ObjectAI.onSensorCollision_hObj = ", hObj )
--     log.message ( "In ObjectAI.onSensorCollision_hNewObject = ", hNewObject )
--     log.message ( "In ObjectAI.onSensorCollision_hNewObject = ", hNewObject )
--     
--     log.message ( "Checking category bit " , bStatic )
-- 
--     
--     
--     if hNewObject ~= nil  then
--     bIsNewObject = object.isEqualTo( hObj, hNewObject )
--     end
--     
--     log.message ( "In ObjectAI.onSensorCollision_bIsNewObject = ", bIsNewObject )
-- 
--     
--     
--     if bIsNewObject 
--     then
--         if bStatic then
--         else
--         log.message ( "SENSORCOLLISSION: hTargetObject = ", hTargetObject )
--         log.message ( "SENSORCOLLISSION: this_Object = ", hObj )
--         log.message ( "SENSORCOLLISSION: hNewObject = ", hNewObject )
--         
--         this.PlaceNewObject ( nSensorID, hTargetObject, nTargetSensorID  )
-- 
--         end
--     else
--     end
-- 
-- 
-- 
--     if bIsNewObject 
--         then
--         
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
--         log.message ( "TEST SENSORS" )
--         log.message ( this.hMovingObject ( ) )
-- 
--     -- do stuff
--     end
--    


--     local nTargetX, nTargetY, nTargetZ = object.getTranslation ( hTargetObject, object.kGlobalSpace  )
--     local nNewX, nNewY, nNewZ = object.getTranslation ( hNewObject, object.kGlobalSpace  )
-- -- 
--     log.message ( "*******************************************")
--     log.message ( this.hMovingObject ( ))
--     log.message ( "*******************************************")
-- 
-- 	
--     
--     this.bOnOverlap ( true)
--     
--     
--     --store handle to moving object
--     --this.hMovingObject ( hNewObject )
--     
--     
-- 
--   

--Get direction vector
--         local n1DirX, n1DirY, n1DirZ object.getDirection ( hNewObject,object.kGlobalSpace )
--         log.message ( "1DirX=", n1DirX, "1DirY=", n1DirY, "1DirZ=", n1DirZ)
-- 
  
--      --*******Target************
--      --calculate the sensor offset and scale in function of boundingbox and object scale
--      
--     local c1x, c1y, c1z = object.getBoundingSphereCenter ( hTargetObject )
--     local x1min, y1min, z1min = object.getBoundingBoxMin ( hTargetObject )
--     local x1max, y1max, z1max = object.getBoundingBoxMax ( hTargetObject )
--     local sc1x, sc1y, sc1z = object.getScale( hTargetObject )
--      
--     local s1x = ( x1max-x1min )
--     local s1y = ( y1max-y1min )
--     local s1z = ( z1max-z1min )
--      
--     -- set sensor size and offset
--     
--     --*******Object***********
--     local c2x, c2y, c2z = object.getBoundingSphereCenter ( hNewObject )
--     local x2min, y2min, z2min = object.getBoundingBoxMin ( hNewObject )
--     local x2max, y2max, z2max = object.getBoundingBoxMax ( hNewObject )
--     local sc2x, sc2y, sc2z = object.getScale( hNewObject )
--      
--     local s2x =  ( x2max-x2min )
--     local s2y = ( y2max-y2min )
--     local s2z =  ( z2max-z2min )
--     
--     
-- --     if this.hMovingObject ( ) == this.getObject (  )
-- --     then
-- --     
--     log.message ( "OnSensor: hTargetObject = ", hTargetObject ," , nTargetX = ", nTargetX  )
--     log.message ( "OnSensor: hNewObject = ", hNewObject, " , nNewX = ", nNewX   )
--     --Find newobject position relative to target
--     
--     
--     local nAnchorAx = x1max + (s2y/2)
--     local nAnchorAz = z1max - (s2z/2)
--     
--     local nAnchorBx = x1max + (s2y/2)
--     local nAnchorBz = z1max - (s2z/2)
-- 
--     local nAnchorCx = x1min - (s2y/2)
--     local nAnchorCz = z1min + (s2z/2)
-- 
--     local nAnchorAx = x1max + (s2y/2)
--     local nAnchorAz = z1max - (s2z/2)
--     
--     local nLimitXmax = c1x+0.5
--     local nLimitXmin = c1z-0.5
--     
--     local nLimitZmax = c1x+2
--     local nLimitZmin = c1z-2
--     --X+ og Z+
--     --if (nNewX > nTargetX ) and (nNewZ > nTargetZ )then
--     
--     if (x1max >= x2min) and ( c2z < nLimitZmax ) and  ( c2z > nLimitZmin ) and (z2max > z1min) then
--     --object.setTranslation ( hNewObject,nAnchorAx-1 , nTargetY, nAnchorAz, object.kLocalSpace )
--     --object.getDirection ( hNewObject )
--     
--     --object.setTranslation ( hNewObject,1 , nTargetY, 1, object.kLocalSpace )
--     
--     --user.sendEventImmediate ( hUser, "MovingObject", "onDeselect", "nil" )
--     log.message ( "X is larger than nTargetX, Z is larger than nTargetZ" )
--     
--     --X- og Z-
--     --elseif (nNewX < nTargetX )and (nNewZ < nTargetZ )then
--     elseif x1min == x2max
--     then
--     --object.setTranslation ( hNewObject,nAnchorCx-1 , nTargetY, nAnchorCz, object.kLocalSpace )
--     log.message ( "X is smaller than nTargetX, Z is smaller than nTargetZ" )
--     --X+ og Z-
--     elseif (nNewX > nTargetX )and (nNewZ < nTargetZ )
--     then
--     
--     log.message ( "X is larger than nTargetX, Z is smaller than nTargetZ" ) 
--     --X- og Z-
--     elseif (nNewX < nTargetX )and (nNewZ < nTargetZ )
--     then
--     log.message ( "X is smaller than nTargetX, Z is smaller than nTargetZ" )
--     --this.nTargetPosX (5 ) 
--     --this.nTargetPosZ (5 )
--     end
--     
--     
    
    
    
     
    --sensor.setBoxCenterAt ( hObject, 0, cx, cy, cz, object.kLocalSpace )
    --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
    --sensor.setBoxSizeAt ( hObject, 0, sx/2, sy/2, sz/2 )
    
    
    
    
    
    --object.matchTranslation( hNewObject, hTargetObject, object.kGlobalSpace )
    
--     
--     user.sendEventImmediate ( this.getUser ( ), "ObjectAI", "onMouseButtonUp" )
--     --this.sendEvent ( "onMouseButtonUp" )

    
    
    
    
    
    
    
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
