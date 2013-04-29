--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    
   this.nButtonPressed ( nButton )
   
   --log.message ( "this_bIsMovingObject 1  ", this.bIsMovingObject ( ) )
     
     if ( this.hMovingObject ( ) )
       then
         local hObject, nHitDist, nHitSurfaceID, x, y, z = scene.getFirstHitColliderEx ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 100 )
        if ( hObject )
        then
            
            --object.setTranslation ( this.hMovingObject ( ), x, y, z, object.kGlobalSpace )
            --this.hMovingObject ( nil )
            
            --hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.SelectCollider" ), false )
            --hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.PickObject" ), true )
        end
    else
        local hObject = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 100 )
        if ( hObject ~= nil )
        then
        
            local hParent = object.getParent ( hObject )
            
            if hParent then
            this.hMovingObject ( hParent )
            local hGroupParent = object.getParent ( hParent )
                if  hGroupParent then
                this.hMovingObject ( hGroupParent )
                local hSuperParent = object.getParent ( hGroupParent )
                    if hSuperParent then
                    this.hMovingObject ( hSuperParent )
                    
                    end
                
                
                end
            end
            
            --log.message ( "this_bIsMovingObject ", this.bIsMovingObject ( ) )
            --this.bIsMovingObject ( true )
            
            --hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.SelectCollider" ), true )
            --hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "MovingObjectHUD.PickObject" ), false )
        end
    end


    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
