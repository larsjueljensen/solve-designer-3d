--------------------------------------------------------------------------------
--  Function......... : fixDragObjectTRSFlags
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.fixDragObjectTRSFlags ( hObject )
--------------------------------------------------------------------------------

    object.setTransformOption ( hObject, object.kTransformOptionInheritsParentTranslation, true )
    object.setTransformOption ( hObject, object.kTransformOptionTranslationAffectedByParentRotation, true )
    object.setTransformOption ( hObject, object.kTransformOptionTranslationAffectedByParentScale, true )
    object.setTransformOption ( hObject, object.kTransformOptionInheritsParentRotation, true )
    
    for i = 0, object.getChildCount ( hObject ) - 1 do
    
        this.fixDragObjectTRSFlags ( object.getChildAt ( hObject, i ) )
    
    end
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
