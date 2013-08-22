--------------------------------------------------------------------------------
--  Function......... : createWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.createWardrobeObject ( hObject )
--------------------------------------------------------------------------------
	
    local hWardrobeObject = scene.createRuntimeObject ( application.getCurrentUserScene ( ), "WardrobeObject" )
    local x, y, z = this.calculateWardrobeObjectPivotLocation ( hObject )
   
    object.setTranslation ( hWardrobeObject, x, y, z, object.kGlobalSpace )
    object.matchRotation ( hWardrobeObject, hObject, object.kGlobalSpace )

    object.addAIModel ( hWardrobeObject, "HighlightObjectAI" )
--    object.addAIModel ( hWardrobeObject, "MovingCollisionAI" )

    object.addAIModel ( hWardrobeObject, "CommonObjectProperties" )
    object.setAIVariable ( hWardrobeObject, "CommonObjectProperties", "articleNumber", this.articleNumber ( ) )
    object.setAIVariable ( hWardrobeObject, "CommonObjectProperties", "articleType", this.articleType ( ) )
    object.setAIVariable ( hWardrobeObject, "CommonObjectProperties", "objectWidth", this.objectWidth ( ) )
    object.setAIVariable ( hWardrobeObject, "CommonObjectProperties", "objectHeight", this.objectHeight ( ) )
    object.setAIVariable ( hWardrobeObject, "CommonObjectProperties", "objectDepth", this.objectDepth ( ) )

    return hWardrobeObject
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
