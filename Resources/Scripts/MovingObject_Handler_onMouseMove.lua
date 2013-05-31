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
--    local b
    local nFrames = 8  --<--used to set rotational sensitivity 
    
    local nFactorX = nNewCursorValueX - nStartPosX
    local nFactorY = nNewCursorValueY - nStartPosY
    local nRotValueY = (nNewCursorValueX-nStartPosX)*18--nObjRotY + nFactor
    local nRotRoundY = math.roundToNearestInteger ( nRotValueY )
    local nRotTempY = nRotRoundY/10
    local nRotY = math.roundToNearestInteger ( nRotTempY )*10  
    
    local nFactorX = nNewCursorValueX - nStartPosX
    local nFactorY = nNewCursorValueY - nStartPosY
    
    local nRotValueY = (nNewCursorValueX-nStartPosX)*18--nObjRotY + nFactor
    local nRotRoundY = math.roundToNearestInteger ( nRotValueY )
    local nRotTempY = nRotRoundY/10
    local nRotY = math.roundToNearestInteger ( nRotTempY )*10        
    
    local hWall = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall1_collider" )
    local hWallBack = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall2_collider" )
    local hWallRight = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall3_collider" )
    local hWallLeft = scene.getTaggedObject ( application.getCurrentUserScene( ), "Wall4_collider" )
    
    
    local hTarget = scene.getTaggedObject ( application.getCurrentUserScene( ), "target" )
    local hObject, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3000 )
    
        
    if hObject then

        local nObjRotationY = 0
        local sColliderTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hObject )
        local xW, yW, zW = object.getTranslation( scene.getTaggedObject ( hScene, sColliderTag ), object.kGlobalSpace )

        -- If we hit the wall initally behind
        if ( string.contains ( sColliderTag, "Wall2" ) ) then

            nObjRotationY = 180

        -- If we hit the wall initally to the right
        elseif ( string.contains ( sColliderTag, "Wall3" ) ) then

            nObjRotationY = -90

        -- If we hit the wall initally to the left    
        elseif ( string.contains ( sColliderTag, "Wall4" ) ) then

            nObjRotationY = 90

        end

        if this.hMovingObject ( ) ~= nil then
            object.setRotation ( this.hMovingObject ( ), 0, nObjRotationY, 0, object.kGlobalSpace )
        end

    end

    if ( this.hMovingObject ( ) and hud.getUnderCursorComponent ( hUser ) == nil ) then
        
        local nObjRotX, nObjRotY, nObjRotZ = object.getRotation( this.hMovingObject ( ), object.kGlobalSpace )
        local nCurrentTransX, nCurrentTransY,  nCurrentTransZ =  object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )
       
        
        local hObject, nHitDist, nHitSurfaceID = scene.getFirstHitCollider ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3000 )

        if nFrameCounter == nFrames then
            this.nFrameCount (0)
          else
            nFrameCounter = nFrameCounter + 1
            this.nFrameCount ( nFrameCounter )
        end
        
        if ( nMode == 2 ) then 
        
            local nRotX, nRotY, nRotZ 
            this.nRotationY ( nObjRotY )

            if ( this.nFrameCount() == 0 ) then 
                
                if nNewCursorValueX < nPreviousX then  
                    local hRotationTarget = object.getParent ( this.hMovingObject( ) )

                    if hRotationTarget == nil then
                    
                        object.rotateTo ( this.hMovingObject ( ) , 0,180,0,object.kLocalSpace, 0.125)
                    
                    else

                        object.rotateTo ( hRotationTarget , 0,180,0,object.kLocalSpace, 0.125)
                        local nAxisX, nAxisY, nAxisZ = object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )

                    end
                
                elseif nNewCursorValueX > nPreviousX then

                    local hRotationTarget = object.getParent ( this.hMovingObject( ) )
                    
                    if hRotationTarget == nil then
                    
                        object.rotateTo ( this.hMovingObject ( ) , 0,-180,0,object.kLocalSpace, 0.125)
                    
                    else

                        object.rotateTo ( hRotationTarget , 0, -180, 0, object.kLocalSpace, 0.125)                    
                        local nAxisX, nAxisY, nAxisZ = object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )

                    end
                end

            end
                  
        elseif nMode == 0 then
             
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
            local sNewTag

            local nState = user.getAIVariable ( this.getUser ( ), "ASPMain", "nSliderMode" )
            
            local nTx, nTy, nTz = object.getTranslation ( hTarget, object.kGlobalSpace )

            if this.hNewObject ( ) then

                sNewTag = object.getModelName ( this.hNewObject( ) )
                
                if  nState == 4 then
                    object.setTranslation ( this.hNewObject ( ), nTransX, 0, zW , object.kGlobalSpace )
                else
                    object.setTranslation ( this.hNewObject ( ), nTransX, 0, nTz + 2.5, object.kGlobalSpace )
                end

            end      
      end

        this.nPreviousCursorX ( nNewCursorValueX )
        this.nPreviousCursorY ( nNewCursorValueY )
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
