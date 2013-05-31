--------------------------------------------------------------------------------
--  Function......... : setObjectOpacity
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.setObjectOpacity ( hObject, nOpacity )
--------------------------------------------------------------------------------

    if ( shape.getMesh ( hObject ) ~= nil ) then
        shape.setMeshOpacity ( hObject, nOpacity )
    end
    
    for i = 0, object.getChildCount ( hObject ) - 1 do
        this.setObjectOpacity ( object.getChildAt ( hObject, i ), nOpacity )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
