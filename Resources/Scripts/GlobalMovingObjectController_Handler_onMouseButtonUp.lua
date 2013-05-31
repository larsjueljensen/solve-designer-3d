--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : Lars Juel Jensen
--  Description...... : Removes the moving object helper created at mouse down
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if (this.hMovingObject ( ) ~= nil ) then

        this.setObjectOpacity ( this.hMovingObject ( ), 1.0 )

        -- Set the parent of the previously stored helper object ( wardrobe / wardrobe group )
        -- to the parent of the previously stored moving object helper
        object.setParent ( this.hHelperObject ( ), object.getParent ( this.hMovingObject ( ) ), true )
        
        -- Destroy the moving object
        scene.destroyRuntimeObject ( application.getCurrentUserScene ( ), this.hMovingObject ( ) )
                
        -- Clear the variables used to store the objects
        this.hHelperObject ( nil )
        this.hMovingObject ( nil )
        
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
