--------------------------------------------------------------------------------
--  Function......... : dropDragObjectIntoPlace
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.dropDragObjectIntoPlace ( )
--------------------------------------------------------------------------------

    if object.isVisible ( this.hDragObject ( ) ) then

        this.setObjectOpacity ( this.hDragObject ( ), 1.0 )
        scene.setObjectTag ( application.getCurrentUserScene ( ), this.hDragObject ( ), "ID_"..this.nextObjectId ( ) )
        this.nextObjectId ( this.nextObjectId ( ) + 1 )

    else

        scene.destroyRuntimeObject ( application.getCurrentUserScene ( ), this.hDragObject ( ) )

    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
-------
