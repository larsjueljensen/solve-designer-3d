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
            
            if ( mode == 0 ) then

                if bCam2D == false then
                
                    local hCam = application.getCurrentUserActiveCamera ( )
                    local nRotationX, nRotationY = object.getRotation ( hCam, object.kGlobalSpace )
                    
                    if this.bWheelUsed ( ) == true then
                        object.sendEvent ( hCam , "ASPCamera", "onRotateBy",  nDeltaX, 0 )
                    end
                end
            end
        end
	end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
