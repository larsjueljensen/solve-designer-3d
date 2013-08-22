--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : Lars Juel Jensen
--  Description...... : Handles movement of articles during drag and drop
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Article types
--------------------------------------------------------------------------------
--  D3D_ACCSRY - Tilbeh�r
--  D3D_FRONT - Front
--  D3D_HULL - Skrog
--  D3D_SHELF - Hylle
--  D3D_SLDOOR - Skyved�r
--  D3D_STRG - Oppbevaring
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    if ( this.hDragObject ( ) ~= nil ) then
    
    
        if (string.compare ( this.articleType ( ), "D3D_HULL" ) == 0) then
            user.sendEventImmediate ( this.getUser ( ), "DragAndDropController", "onMouseMoveHull", nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
        elseif (string.compare ( this.articleType ( ), "D3D_ACCSRY" ) ==0) then
            user.sendEventImmediate ( this.getUser ( ), "DragAndDropController", "onMouseMoveLocal",  nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
        elseif (string.compare ( this.articleType ( ), "D3D_FRONT" ) ==0) then
            user.sendEventImmediate ( this.getUser ( ), "DragAndDropController", "onMouseMoveFront",  nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
        elseif (string.compare ( this.articleType ( ), "D3D_SHELF" ) ==0) then
            user.sendEventImmediate ( this.getUser ( ), "DragAndDropController", "onMouseMoveLocal",  nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
        elseif (string.compare ( this.articleType ( ), "D3D_SLDOOR" ) ==0) then
            user.sendEventImmediate ( this.getUser ( ), "DragAndDropController", "onMouseMoveLocal",  nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
        elseif (string.compare ( this.articleType ( ), "D3D_STRG" ) ==0) then
            user.sendEventImmediate ( this.getUser ( ), "DragAndDropController", "onMouseMoveLocal",  nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
        end
    
    
    end
       
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
