--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    local nPosX, nPosY = hud.getCursorPosition ( this.getUser() )
    
    log.message ( "function ASPMain.onMouseButtonDown: ", sTag )
    
    if ( nPointY < -0.4 ) and ( nPointY > -0.5 )  and nPointX < - 0.3 and nPointX > 0.3 then
    
    this.bWheelUsed ( true )
    end
    
    this.nStartPosX ( nPosX)
    this.nStartPosX ( nPosY)
    
    local hComponent =  hud.getUnderCursorComponent ( this.getUser ( ) )
    
    if  hComponent == nil  
    then
        this.bMouseButtonDown ( true )
        
        
    else

        local hComponent = hud.getUnderCursorComponent ( hUser )
        local sTag = hud.getComponentTag ( hComponent )
   
    end
    
    
    
    
    
    
    local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1500 )
    log.message ( nButton )
            if( hHitObject ) then
                local sName = object.getModelName ( hHitObject )
                local sTag = scene.getObjectTag ( hScene, hHitObject )
--                 log.message ( "Name : ", sName )
--                 log.message ( "Tag : ", sTag )
--                 log.message ( "Distance : ", nHitDist )
--         --         hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MoveObjectHUD.SelectCollider" ), false )
        --         hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MoveObjectHUD.PickObject" ), true )
        -- 
                
                if not sensor.getCategoryBitAt ( hHitObject, 0, 1 ) then
                this.bObjectIsSelected ( true )
                else
                this.bObjectIsSelected ( false )
                end
              
                
        --         --Get handle to parent-dummy
        --         local hParent
        --         
        --         if (object.getParent ( hHitObject)) and not (this.bParentIsSelected( ) ) then
        --         
        --         this.hCurrentObject ( hParent )
        --         elseif hParent and (this.bParentIsSelected())then
        --         
        --         
        --         this.hCurrentObject ( hHitObject )
        --         end
        --         
            end
    
    --Highlight Button.
    
    local hButton = hud.getUnderCursorComponent (  hUser )
    
    log.message ( nPointX )
    log.message ( nPointY )
    
    --local hWheel = hud.getComponent ( hUser, "main." )
    if ( nPointY < -0.4 ) and ( nPointY > -0.5 ) and  ( nPointX < 0.2 ) and ( nPointX > -0.2 )then
    log.message ( "Hitwheel!" )
    this.bWheelUsed ( true )
    end

    
    
   
    
        
        
    
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------