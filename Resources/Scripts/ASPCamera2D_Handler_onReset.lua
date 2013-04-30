--------------------------------------------------------------------------------
--  Handler.......... : onReset
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera2D.onReset (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser()
    
    local bMode = user.getAIVariable ( hUser, "ASPMain", "bCamera2DMode" )
    
    log.message ("In fnc ASPCamera2D.onReset: ", bMode )
    
            this.nDstAngleY ( -90 ) 
            this.nDstDist       ( this.nBSphereRadius ( ) * 2 )
        
    
    --this.SetCamera ( )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------