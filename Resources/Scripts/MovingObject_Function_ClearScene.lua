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
    
    for i = 0 , nSize-1 do
        local sObject = table.getAt ( hObjects, i )
        if sObject ~= nil then
            local hObject = scene.getTaggedObject ( hScene, sObject )

            if hObject then
                local hParent = object.getParent ( hObject )
                scene.destroyRuntimeObject ( hScene, hObject )
            end

            if hParent ~= nil then
                scene.destroyRuntimeObject ( hScene, hParent )
            end
        end
    end
    
    table.empty ( hObjects )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
