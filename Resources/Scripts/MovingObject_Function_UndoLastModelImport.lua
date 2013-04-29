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
    
    log.message ( "table has ", nSize, " entries" )
    
    local hLastObj = table.getLast ( hObjects )
    local hObject = scene.getTaggedObject ( hScene, hLastObj )
    scene.destroyRuntimeObject ( hScene, hObject )
    
    table.removeLast ( hObjects )
    

    
--     for i = 0 , nSize-1
--      do
--       local sObject = table.getAt ( hObjects, i )
--       log.message ( "Got from table: ", sObject, "" )
--                 if sObject ~= nil 
--                     then
--                     
--                         local hObject = scene.getTaggedObject ( hScene, sObject )
--                         scene.destroyRuntimeObject ( hScene, hObject )
--                         --table.removeAt ( hObjects, i )
--         
--                     else
--                 end
--      end
--     
--     table.empty ( hObjects )
-- 
-- 	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
