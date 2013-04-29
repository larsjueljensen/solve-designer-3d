--------------------------------------------------------------------------------
--  Handler.......... : onFocus
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera.onFocus ( hObj )
--------------------------------------------------------------------------------
	
     
     this.ComputeObjectSphere ( hObj )
    local hCam = this.getObject ( )
    local hUser = application.getCurrentUser ( )
    local bMode = user.getAIVariable ( hUser, "ASPMain", "bCamera2DMode" )
    local nPx, nPy, nPz = object.getTranslation (  hObj, object.kGlobalSpace ) 
    
    log.message ( "Got object translation: ", nPx,"   ", nPy,"   ", nPz  )
    

    
    log.message ("In fnc ASPCamera.onFocus: ", bMode )
    
    if this.bObjectZoom ( ) == false 
    then
    
        if hObj then
                local xObj, yObj, zObj = object.getTranslation ( hObj, object.kGlobalSpace ) 
                
                --get. object direction vector
                local x,y,z = object.getDirection ( hObj, object.kGlobalSpace )
                
                log.message ( "Object direction vector = ", x, " ", y, " ", z )

                local xCam,yCam,zCam = object.getDirection ( this.getObject ( ), object.kGlobalSpace )
                
                log.message ( "Object direction vector = ", xCam, " ", yCam, " ", zCam )
                
                --get object bounding sphere
                --
                local nRadius = object.getBoundingSphereRadius ( hObj )
                
                
                
                
    --            object.lookAt ( this.getObject ( ), nPx, nPy, nPz, object.kGlobalSpace, 1.0 )
                this.nDstDist       ( nRadius + 20 )
                this.nDstTargetX    ( nPx )
                this.nDstTargetY    ( nPy + 6 )
                this.nDstTargetZ    ( nPz )
                
                this.nDstAngleX ( 0 )
                this.nDstAngleY ( -18 )
          
                
                log.message ( "Camera FOV = ", camera.getFieldOfView ( this.getObject ( ) ) )
                
                camera.setFieldOfView ( this.getObject ( ), 30 )
                this.bObjectZoom ( true )
             else
        
                  
        end
    
    else
    this.bObjectZoom ( false )
    object.sendEventImmediate ( this.getObject ( ), "ASPCamera", "onReset"  )
    
    
    end
    
    --this.SetCamera ( )
            --object.setRotation( hCam, 0, 0, 0, object.kGlobalSpace )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
