--------------------------------------------------------------------------------
--  Handler.......... : onFocus
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera.onFocus ( hObj )
--------------------------------------------------------------------------------
	
    if this.bObjectZoom ( ) == false then
        
        this.ComputeObjectSphere ( hObj )
        local hUser = application.getCurrentUser ( )
        local bMode = user.getAIVariable ( hUser, "ASPMain", "bCamera2DMode" )
        local nPx, nPy, nPz = object.getTranslation (  hObj, object.kGlobalSpace ) 
    
        if hObj then
            local xObj, yObj, zObj = object.getTranslation ( hObj, object.kGlobalSpace ) 
            local x,y,z = object.getDirection ( hObj, object.kGlobalSpace )            
            local xCam,yCam,zCam = object.getDirection ( this.getObject ( ), object.kGlobalSpace )
            local nRadius = object.getBoundingSphereRadius ( hObj )
            
            this.nDstDist       ( nRadius + 20 )
            this.nDstTargetX    ( nPx )
            this.nDstTargetY    ( nPy + 6 )
            this.nDstTargetZ    ( nPz )
            
            this.nDstAngleX ( 0 )
            this.nDstAngleY ( -18 )
                  
            camera.setFieldOfView ( this.getObject ( ), 30 )
            this.bObjectZoom ( true )
        end
    
    else
        object.sendEventImmediate ( this.getObject ( ), "ASPCamera", "onReset"  )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
