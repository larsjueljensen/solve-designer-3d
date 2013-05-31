--------------------------------------------------------------------------------
--  Function......... : setObjectOpacity
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.setObjectOpacity ( hObject, nOpacity )
--------------------------------------------------------------------------------

    local hMesh = shape.getMesh ( hObject )
    
    if ( hMesh ~= nil ) then
        shape.setMeshOpacity ( hObject, nOpacity )
    end
	
    for i = 0, object.getChildCount ( hObject ) - 1 do
        this.setObjectOpacity ( object.getChildAt ( hObject, i ), nOpacity )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
