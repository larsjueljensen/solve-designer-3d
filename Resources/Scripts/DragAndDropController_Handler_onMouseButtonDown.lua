--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
	local hUnderCursor = hud.getUnderCursorComponent ( this.getUser ( ) )
    
    if ( hUnderCursor ~= nil ) then
    
        if ( this.isPaletteThumbnail ( hUnderCursor ) ) then
            this.createDragObject( hud.getComponentBackgroundImageName ( hUnderCursor ) )
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
