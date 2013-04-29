--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
	this.bMouseButtonDown ( false )
    local bSelectState = this.bObjectIsSelected ( )
    local nCursorReleasePosX, nCursorReleasePosY = hud.getCursorPosition ( this.getUser ( ) )
    
    this.bWheelUsed ( false )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
