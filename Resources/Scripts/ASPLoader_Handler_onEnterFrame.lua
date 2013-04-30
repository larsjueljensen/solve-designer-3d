--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPLoader.onEnterFrame (  )
--------------------------------------------------------------------------------
	
	local hLoader = hud.getComponent ( this.getUser ( ), "loginHUD.Loader" )
    
    local nAngle = this.Angle ( )
    local nDt = application.getLastFrameTime( )
    
    
    if this.isVisible() == true
    then
    
         nAngle = ( ( nAngle + ( 350 * nDt  ) ) )--* ( application.getAverageFrameTime ( ))
        if hLoader then
         hud.setComponentRotation ( hLoader, nAngle )
         else end
        
        --log.message ( nAngle )
        --update member var.
        
        this.Angle ( nAngle )
        
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
