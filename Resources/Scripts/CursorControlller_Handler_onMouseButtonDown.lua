--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local hUser = this.getUser ( )    
    
    user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
    user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
