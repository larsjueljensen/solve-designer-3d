--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	 
 local hUser = application.getCurrentUser ( )
 local hScene = application.getCurrentUserScene ( )
 local hUnderCursorComponent = hud.getUnderCursorComponent ( hUser )
 local hTrash = hud.getComponent ( hUser, "MoveObjectHUD.Trash" )
 local sTag1, sTag2
 this.bListSelection ( false )

 
 this.bMouseDown( false ) 
 
 --hashtable.empty ( this.htChildren ( ) )
 hashtable.empty ( this.htChildrenY ( ) )
 
 if hUnderCursorComponent then
     sTag1 = hud.getComponentTag ( hUnderCursorComponent )
     --log.message ("sTag1: ", sTag1  )
     if hTrash then      
        sTag2 = hud.getComponentTag ( hTrash )  
            local nResult = string.compare ( sTag1,sTag2 )
            if nResult ~= 0 then
            else
            this.DestroyObject (  )
            end
     end
end
      

        if ( application.getTotalFrameTime ( ) - this.nLatestTapTime ( ) < this.nTapMaximumDelay ( ) )
        then
          this.postEvent ( this.nTapMaximumDelay ( ), "onTapAction", this.nLatestTapTime ( ), this.nTapCount ( ) )
        end 
        
        if hUnderCursorComponent --== hTrash
        then

        local sTag = hud.getComponentTag ( hUnderCursorComponent )
        end

log.message( "hMovingObject = ", this.hMovingObject () ) 
if this.hMovingObject ( ) ~= nil then

local sObjectTag = scene.getObjectTag ( hScene, this.hMovingObject() )

this.RecordAction( sObjectTag, 2 )
end



this.hNewObject ( nil )
this.hMovingObject ( nil )
this.TargetIsVisible ( false )
this.bListSelection ( false )

this.Idle ( )



---------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
