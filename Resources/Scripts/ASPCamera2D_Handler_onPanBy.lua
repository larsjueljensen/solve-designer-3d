--------------------------------------------------------------------------------
--  Handler.......... : onPanBy
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera2D.onPanBy ( nDeltaX, nDeltaY )
--------------------------------------------------------------------------------
	
	local xx, xy, xz = object.getXAxis ( this.getObject ( ), object.kGlobalSpace )
    local yx, yy, yz = object.getYAxis ( this.getObject ( ), object.kGlobalSpace )
    local factor     = this.nCurDist ( ) * 0.05
    log.message ( "Currnet distance to object = ", this.nCurDist ( ) )
	
    xx, xy, xz = math.vectorScale ( xx, xy, xz, nDeltaX * factor )
    yx, yy, yz = math.vectorScale ( yx, yy, yz, nDeltaY * factor )
    
    this.nDstTargetX ( this.nDstTargetX ( ) - xx - yx )
    this.nDstTargetY ( this.nDstTargetY ( ) - xy - yy )
    this.nDstTargetZ ( this.nDstTargetZ ( ) - xz - yz )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
