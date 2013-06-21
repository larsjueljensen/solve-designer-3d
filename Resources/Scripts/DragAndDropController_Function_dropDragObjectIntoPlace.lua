--------------------------------------------------------------------------------
--  Function......... : dropDragObjectIntoPlace
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.dropDragObjectIntoPlace ( )
--------------------------------------------------------------------------------

    this.setObjectOpacity ( this.hDragObject ( ), 1.0 )

	scene.setObjectTag ( application.getCurrentUserScene ( ), this.hDragObject ( ), "ID_"..this.nextObjectId ( ) )

    this.nextObjectId ( this.nextObjectId ( ) + 1 )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
-------
