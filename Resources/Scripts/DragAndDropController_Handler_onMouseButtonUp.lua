--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if ( this.hDragObject ( ) ~= nil ) then
        this.dropDragObjectIntoPlace (  )
        this.hDragObject ( nil )
        this.articleNumber ( nil )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
