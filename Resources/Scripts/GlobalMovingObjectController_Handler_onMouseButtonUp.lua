--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : Lars Juel Jensen
--  Description...... : Removes the moving object helper created at mouse down
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if ( nButton == this.kLeftButton ( ) ) then

        if (this.hMovingObject ( ) ~= nil ) then

            this.setObjectOpacity ( this.hMovingObject ( ), 1.0 )
            
            local hParent = object.getParent ( this.hMovingObject ( ) )

            for i = 0, object.getChildCount ( this.hMovingObject ( ) ) - 1 do 
                
                local hChild = object.getChildAt ( this.hMovingObject ( ), i )
                object.setParent ( hChild, hParent, true )
                object.sendEvent ( hChild, "HighlightObjectAI", "onHighlight", false )
            end
                    
            -- Destroy the moving object
            scene.destroyRuntimeObject ( application.getCurrentUserScene ( ), this.hMovingObject ( ) )
            
            -- Clear the variables used to store the objects
            this.hMovingObject ( nil )
            this.correctionAngle ( 0 )
        end

        this.highlightObjectUnderCursor ( nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
        user.sendEvent ( application.getCurrentUser ( ), "HighlightController", "onEnable" )
        
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
