--------------------------------------------------------------------------------
--  Function......... : PlaceNewObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.PlaceNewObject ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local hNewObject = user.getAIVariable ( hUser ,"MovingObject", "hMovingObject")

    
    
    log.message ( "In ObjectAI_fnc_PlaceNewObject" )
    log.message (" ", nSensorID," ", hTargetObject," ", nTargetSensorID  )
    
    this.hTarget ( hTargetObject )
    
    user.setAIVariable ( hUser ,"MovingObject", "hTargetObject", this.hTarget ( ) )
    
    local nTargetX, nTargetY, nTargetZ = object.getTranslation ( hTargetObject, object.kGlobalSpace )
            
    log.message (" ", nTargetX," ", nTargetY," ", nTargetZ  )
    
    local nTargetDirX, nTargetDirY, nTargetDirZ = object.getDirection ( hTargetObject, object.kGlobalSpace )
    
    log.message ("nTargetDirX: ", nTargetDirX," ", nTargetDirY," ", nTargetDirZ  )
    
    local nTargetRotX, nTargetRotY, nTargetRotZ
    
    log.message (" ", nTargetRotX," ", nTargetRotY," ", nTargetRotZ  )
    
    
    local bStatic = sensor.getCategoryBitAt(  hTargetObject, 0 , 1 )
    
    log.message("Place NewObject: ", bStatic )

    
    --match Target DIrection Vector
   -- local TargetDirX, TargetDirY, TargetDirZ = object.matchRotation (  hTargetObject, this.getObject ( ),  object.kGlobalSpace )
    --object.matchRotation (  hTargetObject, this.getObject ( ),  object.kGlobalSpace )
    
    
    --*******Target************
    
    --calculate the sensor offset and scale in function of boundingbox and object scale
     
    local c1x, c1y, c1z = object.getBoundingSphereCenter ( hTargetObject )
    local x1min, y1min, z1min = object.getBoundingBoxMin ( hTargetObject )
    local x1max, y1max, z1max = object.getBoundingBoxMax ( hTargetObject )
    local sc1x, sc1y, sc1z = object.getScale( hTargetObject )
     
    local s1x = ( x1max-x1min )
    local s1y = ( y1max-y1min )
    local s1z = ( z1max-z1min )
    
    --*******Object***********
    
    local c2x, c2y, c2z = object.getBoundingSphereCenter ( hNewObject )
    local x2min, y2min, z2min = object.getBoundingBoxMin ( hNewObject )
    local x2max, y2max, z2max = object.getBoundingBoxMax ( hNewObject )
    local sc2x, sc2y, sc2z = object.getScale( hNewObject )
     
    local s2x =  ( x2max-x2min )
    local s2y = ( y2max-y2min )
    local s2z =  ( z2max-z2min )
    
    
    --Suggestion 1
    
    local nNewPosX, nNewPosY, nNewPosZ = object.getTranslation ( hTargetObject, object.kGlobalSpace )
    local nObjPosX, nObjPosY, nObjPosZ = object.getTranslation ( hNewObject, object.kGlobalSpace )
    
    
    
    -- Get the location of the target object
    local targetX, targetY, targetZ = object.getTranslation ( this.hTarget ( ), object.kGlobalSpace )
    
    
    

-- Get the normalized vector representing the direction of the X axis
    local xX, xY, xZ = object.getXAxis ( this.hTarget ( ), object.kLocalSpace )

-- Scale the vector by 10 units
    xX, xY, xZ = math.vectorScale ( xX, xY, xZ, 10 )

-- add the scaled vector to the target position to get a point 10 units to the right of
-- the target object. 
    local newX, newY, newZ = math.vectorAdd ( targetX, targetY, targetZ, xX, xY, xZ )
--     user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onDeselect" )
-- 
    --object.setTranslation ( hNewObject, newX, newY, newZ, object.kGlobalSpace )
    
    local nDx, nDy, nDz = object.getDirection ( hTargetObject, object.kGlobalSpace )
    log.message ( "Target object Direction: ", nDx," ", nDy," ", nDz )
    
    
if sensor.getCategoryBitAt( hTargetObject, 0, 1 ) == false then --Connect to object.
    
    if this.hMovingObject ( ) ~= nil then
 
        local htDefaultRot = user.getAIVariable ( hUser, "aspmenu_AI", "htRotation" )
        local sModuleName = user.getAIVariable ( hUser, "MovingObject", "sListSelection" )
        
        --set object connected
        
        
        log.message ( "Module name: ", sModuleName )
        local nRotation = hashtable.get ( htDefaultRot, sModuleName )
        log.message ( "Module default rotation: ", nRotation )
        local xR, yR, zR = object.getRotation ( hTargetObject, object.kGlobalSpace )
        log.message ( "Sensorhit: sListSelection = ", sModuleName  )
        log.message ( "Sensorhit: TargetRotation = ", xR," ", yR," ", zR  )
        
        --object.matchRotation ( this.hMovingObject ( ), hTargetObject, object.kGlobalSpace )
        

    
    
        if c2x < x1max and c2x > x1min then
            if c2z < c1z then
            log.message ( "Sensorhit pos Q" )
    --         object.setTranslation ( hNewObject, nNewPosX + ( c1x/2) + ( c2x/2 ), nObjPosY, nObjPosZ, object.kGlobalSpace )
            object.setTranslation ( hNewObject, nNewPosX , nObjPosY, nObjPosZ, object.kGlobalSpace )
            
            
            
            --object.setRotation( this.hMovingObject ( ), xR, nRotation + 90 , zR, object.kGlobalSpace )

            user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
            local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )
            
            log.message ( "nCurrentX: ", nCurrentX )
            log.message ( "nCurrentY: ", nCurrentY )
            log.message ( "nCurrentZ: ", nCurrentZ )


            --pos = q
        elseif c2z > c1z then
             log.message ( "Sensorhit pos R" )
    --      object.setTranslation ( hNewObject, nNewPosX + ( c1x/2) + ( c2x/2 ), nObjPosY, nObjPosZ, object.kGlobalSpace )
            
            local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )
            
            log.message ( "nCurrentX: ", nCurrentX )
            log.message ( "nCurrentY: ", nCurrentY )
            log.message ( "nCurrentZ: ", nCurrentZ )

            user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
            --object.setRotation( this.hMovingObject ( ), xR, nRotation + 90 , zR, object.kGlobalSpace )
            local Xd, Yd, Zd, nSizeXd, nSizeYd, nSizeZd = this.CalculatePosition (  )


            object.setTranslation ( hNewObject, nNewPosX , nObjPosY, nNewPosZ + Zd, object.kGlobalSpace )

            --object.setRotation( this.hMovingObject ( ), xR, yR+90, zR, object.kGlobalSpace )
            local hParent = object.getParent( hTargetObject )
            user.sendEventImmediate ( hUser, "MovingObject", "onAddModule", this.hMovingObject ( ), hParent  )



            -- pos = r
            end
            
        elseif c2z < z1max and c2z > z1min  then
             if c2x > c1x then
              log.message ( "Sensorhit pos P" )
    --      object.setTranslation ( hNewObject, nNewPosX + ( c1x/2) + ( c2x/2 ), nObjPosY, nObjPosZ, object.kGlobalSpace )
    
            
            local Xt, Yt, Zt = object.getTranslation ( hTargetObject, object.kGlobalSpace )
            
            --object.setRotation( this.hMovingObject ( ), xR, nRotation , zR, object.kGlobalSpace )
            local Xd, Yd, Zd, nSizeXd, nSizeYd, nSizeZd = this.CalculatePosition (  )
            log.message ( "From calc: ", Xd, "  " ,Yd , "  ", Zd  )
            log.message ( "From calc: ", nSizeXd, "  " ,nSizeYd , "  ", nSizeZd  )
            
            
            --object.setTranslation ( hNewObject, nObjPosX , nObjPosY, nNewPosZ, object.kGlobalSpace )
            object.setTranslation ( hNewObject, nNewPosX + Xd  , nObjPosY, nNewPosZ, object.kGlobalSpace )
            
            
            
            local nTx, nTy, nTz = object.getRotation ( hTargetObject, object.kGlobalSpace )
            
            
            log.message ( "nTx = ", nTx )
            log.message ( "nTy = ", nTy )
            log.message ( "nTz = ", nTz )
            log.message ( "nRotation = ", nRotation )
            

            
            

            
            user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
            local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )
            
            log.message ( "nCurrentX: ", nCurrentX )
            log.message ( "nCurrentY: ", nCurrentY )
            log.message ( "nCurrentZ: ", nCurrentZ )


            --pos = p
            elseif c2x < c1x then
             log.message ( "Sensorhit pos S" )
            object.setTranslation ( hNewObject, nObjPosX , nObjPosY, nNewPosZ, object.kGlobalSpace )
            --object.setRotation( this.hMovingObject ( ), xR, nRotation , zR, object.kGlobalSpace )
            
            log.message ( "nRotation = ", nRotation )
            
            local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )
            
            log.message ( "nCurrentX: ", nCurrentX )
            log.message ( "nCurrentY: ", nCurrentY )
            log.message ( "nCurrentZ: ", nCurrentZ )
            
            


            user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )

            -- pos = s

            end
            
            local hParent = object.getParent( hTargetObject )
            user.sendEventImmediate ( hUser, "MovingObject", "onAddModule", this.hMovingObject ( ), hParent  )


            
        end
        

    end
else
    user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
    log.message ( "Object hit wall" )

end   


    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
