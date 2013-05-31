--------------------------------------------------------------------------------
--  Handler.......... : onUndo
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onUndo (  )
--------------------------------------------------------------------------------

	local hScene = application.getCurrentUserScene ( )
	local tActions = this.ActionList ( )
    local nStep = this.nActionTableEntry ( )
    local nCurrentStep = this.nCurrentActionStep ( )
    local nSize = 5  
    
    local vObject = table.getAt ( tActions, nSize * nStep - 5 )
    local vAction = table.getAt ( tActions, nSize * nStep - 4 )
    local vData_1 = table.getAt ( tActions, nSize * nStep - 3 )
    local vData_2 = table.getAt ( tActions, nSize * nStep - 2 )
    local vData_3 = table.getAt ( tActions, nSize * nStep - 1 )
    
    local vLast = table.getSize( tActions )
        
    if vObject then
        local hObject = scene.getTaggedObject ( hScene, vObject )
        if vAction == 0 then --Remove object
            this.DestroyObject( hObject )
        elseif vAction == 1 then --Move object to previous coordinates.
            scene.CreateObject ( hObject, 0, 0, vData_1, vData_2, vData_3)
        elseif vAction == 2 then
            object.setTranslation ( hObject, vData_1, vData_2, vData_3, object.kGlobalSpace )
        end
    end
    
    this.nActionTableEntry ( nStep - 1 )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
