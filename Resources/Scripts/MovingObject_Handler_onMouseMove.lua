--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

	local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser()
    local nNewCursorValueX, nNewCursorValueY = hud.getCursorPosition ( hUser )
    local bCameraMode = user.getAIVariable ( hUser, "ASPMain", "bCamera2DMode" )
    
    
    local nStartPosX = this.nCursorStartX ( )
    local nStartPosY = this.nCursorStartY ( )
    local nPreviousX = this.nPreviousCursorX ( )
    local nPreviousY = this.nPreviousCursorY ( )
    
    local nFactorX = (nNewCursorValueX - nStartPosX)/100
    local nFactorY = (nNewCursorValueY - nStartPosY)/100
    local nDt = application.getLastFrameTime ( )
    
    
    local nTrgX = (nStartPosX/8)-10
    local nTrgZ = (nStartPosY/-8)+10
    
    local nBtn = this.nButtonPressed ()
    local nObjX = this.nSelectedObjectTransX ( )
    local nObjY = this.nSelectedObjectTransY ( )
    local nObjZ = this.nSelectedObjectTransZ ( )
    local nFrameCounter = this.nFrameCount ( )
    local nFactor = 10
    local nMode = user.getAIVariable ( hUser,"ASPMain", "nControlMode" )
    local b
    local nFrames = 8  --<--used to set rotational sensitivity 
    
    local nFactorX = nNewCursorValueX - nStartPosX
    local nFactorY = nNewCursorValueY - nStartPosY
    local nRotValueY = (nNewCursorValueX-nStartPosX)*18--nObjRotY + nFactor
    local nRotRoundY = math.roundToNearestInteger ( nRotValueY )
    local nRotTempY = nRotRoundY/10
    local nRotY = math.roundToNearestInteger ( nRotTempY )*10  
    

    --local hPlane, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3000 )
     
    local nFactorX = nNewCursorValueX - nStartPosX
    local nFactorY = nNewCursorValueY - nStartPosY
    
    local nRotValueY = (nNewCursorValueX-nStartPosX)*18--nObjRotY + nFactor
    local nRotRoundY = math.roundToNearestInteger ( nRotValueY )
    local nRotTempY = nRotRoundY/10
    local nRotY = math.roundToNearestInteger ( nRotTempY )*10        

    local xW, yW, zW
    local nIndex


    --*********************Target*****************************
    
    --Get wall handlers
    --
    local hWall = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall1_collider" )
    local hWallBack = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall2_collider" )
    local hWallRight = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall3_collider" )
    local hWallLeft = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall4_collider" )
    --Get translation wall
    
    local hTarget = scene.getTaggedObject ( application.getCurrentUserScene( ), "target" )
    local hObject, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3000 )
    --local hObject, nHitDist, nHitSurfaceID, x, y, z = scene.get ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3000 )
    if hObject then
        if this.hMovingObject ( ) ~= nil then
           local xObjMin, yObjMin, zObjMin = object.getBoundingBoxMin ( this.hMovingObject ( ) )
           local xObjMax, yObjMax, zObjMax = object.getBoundingBoxMax ( this.hMovingObject ( ) )
           
           local xObjCenter
           
        end
   local nObjRotationY 
    
        if object.isEqualTo ( hObject, hWall  ) then    
            if hTarget then
            xW, yW, zW = object.getTranslation( hWall, object.kGlobalSpace )
            object.setRotation ( hTarget, 90, 0, 0 , object.kGlobalSpace )
            object.setTranslation ( hTarget, x , y, zW + 1, object.kGlobalSpace )
            --log.message ( "Trans x = ", x )
            nObjRotationY = 0
            nIndex = 0
            end
        elseif object.isEqualTo ( hObject, hWallLeft  ) then
            if hTarget then
            xW, yW, zW = object.getTranslation( hWallLeft, object.kGlobalSpace )
            object.setRotation ( hTarget, 90, 0, -90 , object.kGlobalSpace )
            object.setTranslation ( hTarget, xW+1 , y, z, object.kGlobalSpace )
            nObjRotationY = 90
            nIndex = 1
            end
        elseif object.isEqualTo ( hObject, hWallRight  ) then
            if hTarget then
            xW, yW, zW = object.getTranslation( hWallRight, object.kGlobalSpace )
            object.setRotation ( hTarget, 90, 0, 90 , object.kGlobalSpace )
            object.setTranslation ( hTarget, xW-1, y, z, object.kGlobalSpace )
            nObjRotationY = -90
            nIndex = 2
            end
        elseif object.isEqualTo ( hObject, hWallBack  ) then
            if hTarget then
            xW, yW, zW = object.getTranslation( hWallBack, object.kGlobalSpace )
            object.setRotation ( hTarget, 90, 0, 180 , object.kGlobalSpace )
            object.setTranslation ( hTarget, x, y, zW-1, object.kGlobalSpace )
            nObjRotationY = 180
            nIndex = 3
            end
        end
    if this.hMovingObject ( ) ~= nil then
       object.setRotation ( this.hMovingObject ( ), 0, nObjRotationY, 0, object.kGlobalSpace )
       
       local nObjTransX, nObjTransY,  nObjTransZ = this.CalculateObjectToWall ( this.hMovingObject ( ), nIndex )
       
        --object.setTranslation ( this.hMovingObject ( ), nObjTransX, nObjTransY,  nObjTransZ, object.kGlobalSpace  )
        log.message (" nObjTransX, nObjTransY,  nObjTransZ = ", nObjTransX,"  ", nObjTransY,"  ",  nObjTransZ )
    
    end

   end
   
   --rotate object according to wall
   --
   
   
   
   
   
    if ( this.hMovingObject ( ) and hud.getUnderCursorComponent ( hUser ) == nil )
    then
        --local xT, yT, zT = object.getRotation ( hTarget, object.kGlobalSpace )
       --object.matchRotation ( this.hMovingObject ( ), hTarget, object.kGlobalSpace  )


    local nObjRotX, nObjRotY, nObjRotZ = object.getRotation( this.hMovingObject ( ), object.kGlobalSpace )
    local nCurrentTransX, nCurrentTransY,  nCurrentTransZ =  object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )
   
    
    local hObject, nHitDist, nHitSurfaceID = scene.getFirstHitCollider ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3000 )
        if nFrameCounter == nFrames --Regulate rotational speed interaction
          then
            this.nFrameCount (0)
          else
            nFrameCounter = nFrameCounter + 1
            this.nFrameCount ( nFrameCounter )
        end
        
        if  (nMode == 2)  then 
            local nRotX, nRotY, nRotZ 
            this.nRotationY ( nObjRotY )
            if ( this.nFrameCount() == 0 )
               then 
                    if nNewCursorValueX < nPreviousX 
                        then  
                            local hRotationTarget = object.getParent ( this.hMovingObject( ) )
                            --Check if object has parent
                            if hRotationTarget == nil then
                            
                            object.rotateTo ( this.hMovingObject ( ) , 0,180,0,object.kLocalSpace, 0.125)
                            
                            else
                            object.rotateTo ( hRotationTarget , 0,180,0,object.kLocalSpace, 0.125)
                            
                            local nAxisX, nAxisY, nAxisZ = object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )
                            end
                        
                    elseif nNewCursorValueX > nPreviousX 
                        then
                            local hRotationTarget = object.getParent ( this.hMovingObject( ) )
                            
                            --Check if object has parent
                            if hRotationTarget == nil then
                            
                            object.rotateTo ( this.hMovingObject ( ) , 0,-180,0,object.kLocalSpace, 0.125)
                            
                            else
                            object.rotateTo ( hRotationTarget , 0, -180, 0, object.kLocalSpace, 0.125)
                            
                            local nAxisX, nAxisY, nAxisZ = object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )
                            --object.rotateToAxisAngle ( hRotationTarget, nAxisX, nAxisY, nAxisZ, 180, object.kGlobalSpace, 0.125 )
                            end
                    end
            end
                  
       elseif nMode == 0 then
            --object.setTranslation ( this.hMovingObject ( ),  (x - nUpdateX) ,nCurrentTransY , z - nUpdateZ   , object.kGlobalSpace )
            
             
            local nUpdateX = this.nOffsetX ( ) - nObjX
            local nUpdateZ = this.nOffsetZ ( ) - nObjZ 
            
            local nUpdateGroupX = this.nOffsetX ( ) - this.nGroupTransX ( )-- -nObjX
            local nUpdateGroupZ = this.nOffsetZ ( ) - this.nGroupTransZ ( ) 


            local nTransGrpX = ((x - nUpdateGroupX))
            local nTransGrpY = this.nGroupTransY( )
            local nTransGrpZ = (z - nUpdateGroupZ)
            
            local nTransX = ((x - nUpdateX))
            local nTransY = nCurrentTransY
            local nTransZ = (z - nUpdateZ)
            
           
            local nObjectTransY = nCurrentTransY
           
            --Get modeltype Check for corner.
            --
            local sNewTag

            local nIsCornerObject 
            local nState = user.getAIVariable ( this.getUser ( ), "ASPMain", "nSliderMode" )

            if this.hNewObject ( ) then
            --compare.
            --
                sNewTag = object.getModelName ( this.hNewObject( ) )
                nIsCornerObject = string.compare ( "3371520", sNewTag )
            
                if nIsCornerObject == 0 then
                object.setTranslation ( this.hNewObject ( ), nTransX, 0, zW+5.5 , object.kGlobalSpace )
                --log.message ( "nIsCorner: ", nIsCornerObject )
                
                else
                    if  nState == 4           
                    then
                    object.setTranslation ( this.hNewObject ( ), nTransX, 0, zW , object.kGlobalSpace )
                    --log.message ( "nIsCorner: ", nIsCornerObject )
                    else
                    
                    --Set object position relative to wall hit.
                    --
                    --object.setTranslation ( this.hNewObject ( ), nTransX, 0, nTz + 2.5, object.kGlobalSpace )
                    
                    --this.CalculateObjectToWall ( this.hMovingObject ( ),  )
                    object.setTranslation ( this.hNewObject ( ), nTransX, 0, nTz + 2.5, object.kGlobalSpace )
                    
                    
                    end
                end
            end
            
            local nTx, nTy, nTz = object.getTranslation ( hTarget, object.kGlobalSpace )
            
            if this.hMovingObject ( )  then
                sNewTag = object.getModelName ( this.hMovingObject( ) )
                nIsCornerObject = string.compare ( "3371520", sNewTag )

                if nIsCornerObject ==  0 then
                --object.setTranslation ( this.hMovingObject ( ), nTransX, 0, zW+6 , object.kGlobalSpace )
                --log.message ( "nIsCorner: ", nIsCornerObject )
                
                else
                
                
                   
                    object.setTranslation ( this.hMovingObject ( ), nTransX, 0, nTz + 2.5, object.kGlobalSpace )
                  --log.message ( "nIsCorner: ", nIsCornerObject )
                    
                end

            end

            
            --Switch between single object and group
            if object.getParent ( this.hMovingObject ( ) ) == nil then--move object
            else --move group 
            end
            
             
                local nCurrentTransX, nCurrentTransY,  nCurrentTransZ =  object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )
    
                --log.message ( nCurrentTransX,"   ", nCurrentTransY, "   ", nCurrentTransZ )
                --log.message ( "nCTransX: ",nTransX,"   ", nTransY, "   ", nTransZ )
  
  end
        this.nPreviousCursorX ( nNewCursorValueX )
        this.nPreviousCursorY ( nNewCursorValueY )

end

-- -- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
