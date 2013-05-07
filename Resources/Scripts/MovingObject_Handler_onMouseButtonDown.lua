--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    local hScene = application.getCurrentUserScene()
    local hUser = application.getCurrentUser ( )
    local hUnderCursor = hud.getUnderCursorComponent( hUser )
    local nStartPosX, nStartPosY = hud.getCursorPosition ( this.getUser ( ) )

    this.nCursorStartX ( nStartPosX )
    this.nCursorStartY ( nStartPosY )
    this.nButtonPressed ( nButton )

    if hUnderCursor == nil then 

        if ( application.getTotalFrameTime ( ) - this.nLatestTapTime ( ) < this.nTapMaximumDelay ( ) ) then
             this.nTapCount ( this.nTapCount ( ) + 1 )
        else
             this.nTapCount ( 1 )
        end
        
        this.nLatestTapTime ( application.getTotalFrameTime ( ) )

        if ( this.hMovingObject ( ) ) then
            local hPlane, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
            if ( hPlane ) then
                this.hMovingObject ( nil )
            end
        else
            local hHitObject = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
            if ( hHitObject ) then

                local hParent = this.GetTopNode ( hHitObject )
                local bSensorCategory = sensor.getCategoryBitAt ( hHitObject, 0 , 4 )

                if bSensorCategory == true then

                    local hParent = this.GetTopNode ( hHitObject )
                    if hParent then

                        this.hMovingObject ( hParent )
                        this.hUnderCursorObject ( hHitObject )

                end
             end
                    
            if not hUnderCursor then
                this.hLastObject( this.hMovingObject ( ) )
            end
        end
    end
    
    local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )

    if hHitObject then
        local sName = object.getModelName ( hHitObject )
        local sTag = scene.getObjectTag ( hScene, hHitObject )
        this.sSelectionTag ( sTag )
    end
    
    
    local hPopup = hud.getComponent( hUser, "main.DeleteButton" ) 
    hud.setComponentVisible ( hPopup, false )

    if ( this.hMovingObject ( ) == nil ) then
        if this.bListSelection ( ) == true then
            local hPlane, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
            if hPlane then
                this.CreateObject ( hPlane, nHitDist, nHitSurfaceID, x, y, z )
            end
        end

        this.hMovingObject( nil )
    elseif ( this.hMovingObject ( ) ) and  not bSensorCategory then

        local sSelectionTag = scene.getObjectTag ( hScene, this.hMovingObject ( ) )
        this.sListSelection ( object.getModelName ( this.hMovingObject ( ) ))
        local hPlane, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )

        object.setAIVariable ( this.hMovingObject ( ),"ObjectAI", "hMovingObject", hHitObject ) 
        object.setAIVariable ( this.hMovingObject ( ),"ObjectAI", "bIsMovingObject", true )
        object.setVisible ( this.hMovingObject ( ), true )
            
        this.nOffsetX ( x )
        this.nOffsetZ ( z )
        
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
                end
            end
        end

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
