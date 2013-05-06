--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
	--Check for undercursor object or hudcomponent
    --
    --**************************************
    --States:                              
    -- 0 = Floor under cursor.           
    -- 1 = Wall 1 under cursor.            
    -- 2 = Wall 2 under cursor.
    -- 3 = Wall 3 under cursor.
    -- 4 = 3D Object under cursor.
    -- 5 =.
    -- 6
    -- .......
    --*************************************
    
    local hUnderCursorComponent = hud.getUnderCursorComponent ( hUser )
    

    if not hUnderCursorComponent then
 
        this.sceneMouseMove ( application.getCurrentUserScene ( ), nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
    
    end
    
    if nPointY <= -0.5 and nPointY >= -0.90 then
    
        this.handleCursorOverPalette( nPointX )
        user.setAIVariable ( this.getUser ( ), "Slider", "CursorPos", nPointX )                
    else
        --log.message ( "PALETTE SCROLLING OFF" )
        --user.setAIVariable ( this.getUser ( ), "Slider", "nSliderScrolling", 0 )
        user.sendEvent ( hUser, "SliderEvents", "onArrowLeft", "MySlider", false )
    end

    
    
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
