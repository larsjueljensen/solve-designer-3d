--------------------------------------------------------------------------------
--  Function......... : createDragObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.createDragObject ( sArticleNumber )
--------------------------------------------------------------------------------
	
    local hObject = scene.createRuntimeObject ( application.getCurrentUserScene ( ), sArticleNumber.."/"..sArticleNumber )
    local hWardrobeObject = this.createWardrobeObject ( hObject )
    object.setParent ( hObject, hWardrobeObject, true )

    object.setVisible ( hWardrobeObject, false )
    this.articleNumber ( sArticleNumber )
    this.setObjectOpacity ( hWardrobeObject, 0.8 )
    this.hDragObject ( hWardrobeObject )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
