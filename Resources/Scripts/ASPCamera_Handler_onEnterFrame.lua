--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera.onEnterFrame (  )
--------------------------------------------------------------------------------
	
    local dt            = application.getLastFrameTime ( )
    local curAngleX     = math.interpolate ( this.nCurAngleX  ( ), this.nDstAngleX  ( ), 10 * dt )
    local curAngleY     = math.interpolate ( this.nCurAngleY  ( ), this.nDstAngleY  ( ), 10 * dt )
    local curDist       = math.interpolate ( this.nCurDist    ( ), this.nDstDist    ( ), 10 * dt )
    local curTargetX    = math.interpolate ( this.nCurTargetX ( ), this.nDstTargetX ( ), 10 * dt )
    local curTargetY    = math.interpolate ( this.nCurTargetY ( ), this.nDstTargetY ( ), 10 * dt )
    local curTargetZ    = math.interpolate ( this.nCurTargetZ ( ), this.nDstTargetZ ( ), 10 * dt )
    
    this.nCurAngleX  ( curAngleX  )
    this.nCurAngleY  ( curAngleY  )
    this.nCurDist    ( curDist    )
    this.nCurTargetX ( curTargetX )
    this.nCurTargetY ( curTargetY )
    this.nCurTargetZ ( curTargetZ )
                      
    object.setTranslation   ( this.getObject ( ), curTargetX, curTargetY, curTargetZ, object.kGlobalSpace )
	object.setRotation      ( this.getObject ( ), 0, curAngleX, 0, object.kGlobalSpace )
    object.rotate           ( this.getObject ( ), curAngleY, 0, 0, object.kLocalSpace )
    object.translate        ( this.getObject ( ), 0, 0, curDist, object.kLocalSpace )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
