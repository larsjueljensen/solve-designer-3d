--------------------------------------------------------------------------------
--  Function......... : AddMain
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.AddMain ( hComponent, nHeightPos)
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local sSelection = this.nModelID ( )
    local nChildren = object.getChildCount ( hComponent )
    
    for i = 0, nChildren - 1 do
    
        local hChild = object.getChildAt ( hComponent, i )
        local sName = object.getModelName ( hChild )
        
        if string.compare ( sSelection, sName ) == 0 then
            
            if this.bListSelection ( ) == true then
                local hNewObject = scene.createRuntimeObject ( hScene, sName )
                local sTag = scene.setObjectTag ( hScene, hChild, sName..i )
                this.bListSelection ( false )
                local nTmplX, nTmplY, nTmplZ = object.getTranslation ( hChild , object.kGlobalSpace )
                object.setTranslation ( hNewObject, nTmplX, nHeightPos, nTmplY, object.kGlobalSpace )
            end
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
