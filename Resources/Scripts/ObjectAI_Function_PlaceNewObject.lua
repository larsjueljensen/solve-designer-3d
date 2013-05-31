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

    this.hTarget ( hTargetObject )
    
    user.setAIVariable ( hUser ,"MovingObject", "hTargetObject", this.hTarget ( ) )
    
    local nTargetX, nTargetY, nTargetZ = object.getTranslation ( hTargetObject, object.kGlobalSpace )
    local nTargetDirX, nTargetDirY, nTargetDirZ = object.getDirection ( hTargetObject, object.kGlobalSpace )
    local nTargetRotX, nTargetRotY, nTargetRotZ
    local bStatic = sensor.getCategoryBitAt(  hTargetObject, 0 , 1 )
     
    local c1x, c1y, c1z = object.getBoundingSphereCenter ( hTargetObject )
    local x1min, y1min, z1min = object.getBoundingBoxMin ( hTargetObject )
    local x1max, y1max, z1max = object.getBoundingBoxMax ( hTargetObject )
    local sc1x, sc1y, sc1z = object.getScale( hTargetObject )
     
    local s1x = ( x1max-x1min )
    local s1y = ( y1max-y1min )
    local s1z = ( z1max-z1min )
    
    local c2x, c2y, c2z = object.getBoundingSphereCenter ( hNewObject )
    local x2min, y2min, z2min = object.getBoundingBoxMin ( hNewObject )
    local x2max, y2max, z2max = object.getBoundingBoxMax ( hNewObject )
    local sc2x, sc2y, sc2z = object.getScale( hNewObject )
     
    local s2x =  ( x2max-x2min )
    local s2y = ( y2max-y2min )
    local s2z =  ( z2max-z2min )
    
    local nNewPosX, nNewPosY, nNewPosZ = object.getTranslation ( hTargetObject, object.kGlobalSpace )
    local nObjPosX, nObjPosY, nObjPosZ = object.getTranslation ( hNewObject, object.kGlobalSpace )
    local targetX, targetY, targetZ = object.getTranslation ( this.hTarget ( ), object.kGlobalSpace )

    local xX, xY, xZ = object.getXAxis ( this.hTarget ( ), object.kLocalSpace )
    xX, xY, xZ = math.vectorScale ( xX, xY, xZ, 10 )

    local newX, newY, newZ = math.vectorAdd ( targetX, targetY, targetZ, xX, xY, xZ )
    local nDx, nDy, nDz = object.getDirection ( hTargetObject, object.kGlobalSpace )
    
    if sensor.getCategoryBitAt( hTargetObject, 0, 1 ) == false then --Connect to object.
    
        if this.hMovingObject ( ) ~= nil then
     
            local htDefaultRot = user.getAIVariable ( hUser, "aspmenu_AI", "htRotation" )
            local sModuleName = user.getAIVariable ( hUser, "MovingObject", "sListSelection" )
            local nRotation = hashtable.get ( htDefaultRot, sModuleName )
            local xR, yR, zR = object.getRotation ( hTargetObject, object.kGlobalSpace )
        
            if c2x < x1max and c2x > x1min then
                if c2z < c1z then
                    object.setTranslation ( hNewObject, nNewPosX , nObjPosY, nObjPosZ, object.kGlobalSpace )
                    user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
                    local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )

                elseif c2z > c1z then

                    local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )
                    
                    user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
                    local Xd, Yd, Zd, nSizeXd, nSizeYd, nSizeZd = this.CalculatePosition (  )

                    object.setTranslation ( hNewObject, nNewPosX , nObjPosY, nNewPosZ + Zd, object.kGlobalSpace )
                end
                
            elseif c2z < z1max and c2z > z1min  then
                if c2x > c1x then
                    local Xt, Yt, Zt = object.getTranslation ( hTargetObject, object.kGlobalSpace )
                    local Xd, Yd, Zd, nSizeXd, nSizeYd, nSizeZd = this.CalculatePosition (  )
                    object.setTranslation ( hNewObject, nNewPosX + Xd  , nObjPosY, nNewPosZ, object.kGlobalSpace )
                    
                    local nTx, nTy, nTz = object.getRotation ( hTargetObject, object.kGlobalSpace )
                    
                    user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
                    local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )

                elseif c2x < c1x then
                    object.setTranslation ( hNewObject, nObjPosX , nObjPosY, nNewPosZ, object.kGlobalSpace )
                    local nCurrentX, nCurrentY, nCurrentZ = object.getRotation ( this.hMovingObject ( ), object.kGlobalSpace )            
                    user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
                end
            end
        end
    else
        user.sendEventImmediate ( hUser, "MovingObject", "onMouseButtonUp" )
    end   
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
