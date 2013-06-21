--------------------------------------------------------------------------------
--  Function......... : createDragObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.createDragObject ( sArticleNumber )
--------------------------------------------------------------------------------
	
    local hObject = scene.createRuntimeObject ( application.getCurrentUserScene ( ), sArticleNumber.."/"..sArticleNumber )
    this.setDragObjectSensorMaskBits ( hObject )
    this.fixDragObjectTRSFlags( hObject )
    
    local hWardrobeObject = this.createWardrobeObject ( hObject )
    object.setParent ( hObject, hWardrobeObject, true )
    object.setVisible ( hWardrobeObject, false )
    this.articleNumber ( sArticleNumber )
    this.setObjectOpacity ( hWardrobeObject, 0.8 )
    this.addHullSensors ( hWardrobeObject )
    this.hDragObject ( hWardrobeObject )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
