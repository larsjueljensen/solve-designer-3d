--------------------------------------------------------------------------------
--  Handler.......... : onTopView
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera.onTopView (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser()
    local hCam = this.getObject ( )
    local bMode = user.getAIVariable ( hUser, "ASPMain", "bCamera2DMode" )
    
        if bMode then
            this.nDstAngleY ( -90 ) 
            this.nDstDist       ( this.nBSphereRadius ( ) * 2 )
        else
            this.nDstAngleY ( -90 )
            this.nDstDist       ( this.nBSphereRadius ( ) * 2 )
            this.nDstTargetX    ( this.nBSphereX      ( ) )
            this.nDstTargetY    ( this.nBSphereY      ( ) )
            this.nDstTargetZ    ( this.nBSphereZ      ( ) )
            
            
            
            --set rotation
            this.nDstAngleX ( 0 )
            --object.setRotation( hCam, 0, 0, 0, object.kGlobalSpace )
        end
    
    --this.SetCamera ( )
    object.setRotation( hCam, 0, 0, 0, object.kGlobalSpace )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
