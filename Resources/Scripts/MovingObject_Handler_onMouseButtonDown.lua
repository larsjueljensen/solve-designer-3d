--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	log.message ("In MovingObject.onMouseButtonDown: Button = ", nButton  )
    
        
    local hScene = application.getCurrentUserScene()
    local hUser = application.getCurrentUser ( )
    local nStartPosX, nStartPosY = hud.getCursorPosition ( this.getUser ( ) )
    this.nCursorStartX ( nStartPosX )
    this.nCursorStartY ( nStartPosY )
    this.nButtonPressed ( nButton )
    
    local hUnderCursor = hud.getUnderCursorComponent( hUser )
    if hUnderCursor == nil then 
    
    
    --detecting tap
        if ( application.getTotalFrameTime ( ) - this.nLatestTapTime ( ) < this.nTapMaximumDelay ( ) )
        then
             this.nTapCount ( this.nTapCount ( ) + 1 )
        else
             this.nTapCount ( 1 )
        end
    
    this.nLatestTapTime ( application.getTotalFrameTime ( ) )

        if ( this.hMovingObject ( )  )
        then
            local hPlane, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
                if ( hPlane )
                then
                    this.hMovingObject ( nil )
                    --log.message ( "No Object in focus: ", hPlane )
                    
                end
        else
            local hHitObject = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
                if ( hHitObject ) then
                                
                --Find hitObject Parent structure
                local hParent = this.GetTopNode ( hHitObject )
                
                log.message ( "User clicked : ", hHitObject )
                local bSensorCategory = sensor.getCategoryBitAt ( hHitObject, 0 , 4 )
                
                log.message ( "Sensor state 4 = ", bSensorCategory )
                
                    if bSensorCategory == true then
                            --Get hitobject parent.
                            --
                        --local hParent = object.getParent ( hHitObject )
                        local hParent = this.GetTopNode ( hHitObject )
                        
                        log.message( "GotSuperParent: ", hParent )
                        log.message ( "Got object superparent : ", hParent )
                           
                            
                        if hParent then
                                
                            this.hMovingObject ( hParent )
                            log.message ( "Got object superparent : ", hParent )
                            this.hUnderCursorObject ( hHitObject )

                        end
                     end
                    
                    if not hUnderCursor then
                    this.hLastObject( this.hMovingObject ( ) )
                    else
                    end
                end
        end
        local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )

    if(hHitObject) then
        local sName = object.getModelName ( hHitObject )
        local sTag = scene.getObjectTag ( hScene, hHitObject )
        log.message ( "Name : ", sName )
        log.message ( "Tag : ", sTag )
        
        this.sSelectionTag ( sTag )
        log.message ( "Distance : ", nHitDist )
            if not sensor.getCategoryBitAt ( hHitObject, 0, 1 ) then
            log.message ( "Got handle to object: ", hHitObject )  
            end
      
    end
    
    
    local hPopup = hud.getComponent( hUser, "main.DeleteButton" ) 
    
    hud.setComponentVisible ( hPopup, false )


--    ***********************************************************************************************************
--     
--  




      
    if ( this.hMovingObject ( ) == nil )
       then
        log.message ( "No object to move" )
        --Check if raycast hits object (hObject = plane )
            if this.bListSelection ( ) == true then
                local hPlane, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
                if hPlane then
                this.CreateObject ( hPlane, nHitDist, nHitSurfaceID, x, y, z )
                else
                
                end
            else
            end

            this.hMovingObject( nil )
    elseif ( this.hMovingObject ( ) ) and  not bSensorCategory
    then

        --Get tag
        local sSelectionTag = scene.getObjectTag ( hScene, this.hMovingObject ( ) )
        
--         log.message ( "Object is movable "   )
        --this.hMovingObject ( hHitObject )
        this.sListSelection ( object.getModelName ( this.hMovingObject ( ) ))
        --this.bListSelection (  ) 
        
            local hPlane, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )

            object.setAIVariable ( this.hMovingObject ( ),"ObjectAI", "hMovingObject", hHitObject ) 
            object.setAIVariable ( this.hMovingObject ( ),"ObjectAI", "bIsMovingObject", true )
            object.setVisible ( this.hMovingObject ( ), true )
            
                        this.nOffsetX ( x )
                        this.nOffsetZ ( z )
                        
                        --list children coordinates
                        
                        --local hParent = object.getParent ( object.getParent ( hHitObject ) )
                        
                        
                        
                        
                        if hParent ~= nil then
                            local nGx, nGy, nGz = object.getTranslation ( hParent, object.kGlobalSpace )
                            this.nGroupTransX ( nGx )
                            this.nGroupTransY ( nGy )
                            this.nGroupTransZ ( nGz )

                            local nChildren = object.getChildCount ( hParent )
                            for i = 0, nChildren-1 do
                                local htTableX = this.htChildren ( )
                                local htTableY = this.htChildrenY ( )
                                
                                local hChild = object.getChildAt ( hParent, i )
                                
                                
                                local nChildX, nChildY, nChildZ = object.getTranslation (  hChild, object.kGlobalSpace )
                                local sName = scene.getObjectTag ( hScene, hChild )
                                
                                if sName ~= "" then
                                hashtable.add ( htTableX , sName, nChildX )
                                hashtable.add ( htTableY , sName, nChildZ )
                                --log.message ( "Added: ", sName )
                                else
                                end
                                
                            end
                        end
--                         log.message ( "Object hit by raycast: ", this.hMovingObject ( )  )
--                         log.message( "MouseBtnDown: At X= ", x )
--                        
                local nCurrentObjTransX, nCurrentObjTransY,  nCurrentObjTransZ =  object.getTranslation ( this.hMovingObject ( ), object.kGlobalSpace )
                
                this.nObjectStartX ( nCurrentObjTransX )
                this.nObjectStartY ( nCurrentObjTransY )
                this.nObjectStartZ ( nCurrentObjTransZ )
                
                this.nSelectedObjectTransX ( nCurrentObjTransX )
                this.nSelectedObjectTransY ( nCurrentObjTransY )
                this.nSelectedObjectTransZ ( nCurrentObjTransZ )
             
                this.nPreviousCursorY ( nStartPosY)
                this.nPreviousCursorX ( nStartPosX)
               
    end
    
--Double/singletap management


if this.nButtonPressed ( ) == 0 then

    if hUnderCursor == nil 
    then  
        local hDeleteBtn = hud.getComponent ( this.getUser ( ), "main.DeleteButton" ) 
        hud.setComponentVisible (hDeleteBtn, false  )

    else

        
        --log.message ( "sElementName: ", sContainerTag  )
        --log.message ( "UnderCursorComponent: ", hUnderCursor )
        
        local hContainer = hud.getComponentContainer ( hUnderCursor )
        if hContainer then
            local sContainerTag = hud.getComponentTag (  hContainer )
            --log.message ( "Component sName: ", sName)
                
            if string.compare( sContainerTag, "Dialog_Object" ) then
                --log.message ( "hUnderCursor: ", hUnderCursor )
                --hud.callAction ( hUser, "DialogsHUD.Close_Object" )   
            else
                hud.callAction ( hUser, "Dialogs.Close_Object" )
            end
        end    
    end
end

    --Detect hold touch
    
    --log.message ( "Cursorstart: ", this.nCursorStartX ( ), " , ", this.nCursorStartY ( ) )


local hList = hud.getUnderCursorComponent ( hUser )




if hList then
local sTag = hud.getComponentTag ( hList )
end

local sListObjectTag = "DefaultRotation"

if hList and (sTag == sListObjectTag )then
local kType = hud.getComponentType ( hList )
local nItem = hud.getUnderCursorListItem ( hUser )

        
else

end
    this.bMouseDown ( true )
    this.postEvent (  1, "onCheckHold", nPointX, nPointY )
    
end



--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
