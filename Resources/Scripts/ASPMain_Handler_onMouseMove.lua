--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local bCam2D = this.bCamera2DMode ( )
    
    if this.bObjectIsSelected ( ) == false 
    then
        if ( this.bMouseButtonDown ( ) )
        then
            local mode = this.nControlMode ( )
            
            if ( mode == 1 )  
            then
                -- Zoom
                --
            elseif ( mode == 2 )
            then
                -- Pan
                --
                
            elseif ( mode == 0 ) then
                -- Rotate
                --
                if bCam2D == true then
                else
                
                local hCam = application.getCurrentUserActiveCamera ( )
                
                local nRotationX, nRotationY = object.getRotation ( hCam, object.kGlobalSpace )
                    
                    
                    --if ( nPointY < -0.4 ) and ( nPointY > -0.5 )  then
                    if this.bWheelUsed ( ) == true then
                    
                    log.message( "Wheel used" )
                    
                    local hWheel = hud.getComponent ( this.getUser( ), "main.Wheel" )
                    log.message ( "ref comp: ", hWheel )
                    local hComponent = hud.getUnderCursorComponent ( this.getUser ( ) )
                    log.message ( "hud.comp: ", hComponent )
                    
                    user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetWheelPosition", nRotationY )
   
                    
                    object.sendEvent ( hCam , "ASPCamera", "onRotateBy",  nDeltaX, 0 )
                    else
                    end
                end
            end
            
        end
	end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------