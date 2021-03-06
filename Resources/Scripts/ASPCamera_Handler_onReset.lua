--------------------------------------------------------------------------------
--  Handler.......... : onReset
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera.onReset (  )
--------------------------------------------------------------------------------

	this.computeSceneBSphere ( )
    
    local hUser = application.getCurrentUser()
    local bMode = user.getAIVariable ( hUser, "ASPMain", "bCamera2DMode" )

    if bMode then

        this.nDstAngleY ( -90 ) 
        this.nDstDist       ( this.nBSphereRadius ( )  )

    else

        this.nDstAngleY ( -4 )
        this.nDstDist       ( this.nBSphereRadius ( ) -150 )
        this.nDstTargetX    ( this.nBSphereX      ( )  )
        this.nDstTargetY    ( this.nBSphereY      ( ) + 8 )
        this.nDstTargetZ    ( this.nBSphereZ      ( ) + 5  )
        this.nDstAngleX ( -0 )
        
        camera.setFieldOfView ( this.getObject ( ), 28 )

    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
