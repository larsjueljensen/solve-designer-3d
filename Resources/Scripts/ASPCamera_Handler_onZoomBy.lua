--------------------------------------------------------------------------------
--  Handler.......... : onZoomBy
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera.onZoomBy ( nDeltaX, nDeltaY )
--------------------------------------------------------------------------------
	this.nDstDist ( this.nDstDist ( ) * ( 1 + nDeltaY ) )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
