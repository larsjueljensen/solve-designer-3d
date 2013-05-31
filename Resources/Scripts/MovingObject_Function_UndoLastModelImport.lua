--------------------------------------------------------------------------------
--  Function......... : UndoLastModelImport
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.UndoLastModelImport ( )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hObjects = this.tObjectGroup ( )        
    local nSize = table.getSize ( hObjects )
    local hLastObj = table.getLast ( hObjects )
    local hObject = scene.getTaggedObject ( hScene, hLastObj )
    
    scene.destroyRuntimeObject ( hScene, hObject )
    table.removeLast ( hObjects )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
