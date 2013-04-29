--------------------------------------------------------------------------------
--  Function......... : ClearScene
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.ClearScene ( )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hObjects = this.tObjectGroup ( )        
    local nSize = table.getSize ( hObjects )
    
    log.message ( "table has ", nSize, " entries" )
    
    for i = 0 , nSize-1
     do
      local sObject = table.getAt ( hObjects, i )
      log.message ( "Got from table: ", sObject, "" )
                if sObject ~= nil 
                    then
                    
                        local hObject = scene.getTaggedObject ( hScene, sObject )
                        
                            if hObject then
                            local hParent = object.getParent ( hObject )
                            scene.destroyRuntimeObject ( hScene, hObject )
                            else
                            end
                        
                        if hParent ~= nil then
                        
                        scene.destroyRuntimeObject ( hScene, hParent )
                        end
                        
                        
                        --table.removeAt ( hObjects, i )
        
                    else
                end
     end
    
    table.empty ( hObjects )
    
    
    

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------