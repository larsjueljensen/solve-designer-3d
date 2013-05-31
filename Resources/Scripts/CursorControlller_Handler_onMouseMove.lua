--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )    
    local hUnderCursorComponent = hud.getUnderCursorComponent ( hUser )

    if not hUnderCursorComponent then
 
        this.sceneMouseMove ( application.getCurrentUserScene ( ), nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
    
    end
    
    if nPointY <= -0.5 and nPointY >= -0.90 then
    
        this.handleCursorOverPalette( nPointX )
        user.setAIVariable ( this.getUser ( ), "Slider", "CursorPos", nPointX )                
    else
        user.sendEvent ( hUser, "SliderEvents", "onArrowLeft", "MySlider", false )
    end

    
    
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
