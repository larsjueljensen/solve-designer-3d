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
 
    this.nStartPosX ( nPosX)
    this.nStartPosX ( nPosY)
    
    this.bMouseButtonDown ( true )    
    
    local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1500 )
    if( hHitObject ) then

        local sName = object.getModelName ( hHitObject )
        local sTag = scene.getObjectTag ( hScene, hHitObject )
        
        if not sensor.getCategoryBitAt ( hHitObject, 0, 1 ) then
            this.bObjectIsSelected ( true )
        else
            this.bObjectIsSelected ( false )
        end
      
    end
    
    if ( nPointY < -0.4 ) and ( nPointY > -0.5 ) and  ( nPointX < 0.2 ) and ( nPointX > -0.2 )then
        this.bWheelUsed ( true )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
