--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local bCam2D = this.bCamera2DMode ( )
    
    if this.bObjectIsSelected ( ) == false then

        if ( this.bMouseButtonDown ( ) ) then

            local mode = this.nControlMode ( )
            
            if ( mode == 1 )  then
                -- Zoom
            elseif ( mode == 2 )
            then
                -- Pan
            elseif ( mode == 0 ) then
                -- Rotate
                if bCam2D == false then
                
                    local hCam = application.getCurrentUserActiveCamera ( )
                    local nRotationX, nRotationY = object.getRotation ( hCam, object.kGlobalSpace )
                    
                    if this.bWheelUsed ( ) == true then
                    
                        local hWheel = hud.getComponent ( this.getUser( ), "main.Wheel" )
                        local hComponent = hud.getUnderCursorComponent ( this.getUser ( ) )
                    
                        --user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetWheelPosition", nRotationY )
                        object.sendEvent ( hCam , "ASPCamera", "onRotateBy",  nDeltaX, 0 )
                    end
                end
            end
        end
	end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
