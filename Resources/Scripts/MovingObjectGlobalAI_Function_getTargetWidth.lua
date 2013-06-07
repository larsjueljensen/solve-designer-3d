--------------------------------------------------------------------------------
--  Function......... : getTargetWidth
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.getTargetWidth ( hObject )
--------------------------------------------------------------------------------

    local width = 0
    local aiModel = "CommonObjectProperties"
    
    if ( object.hasAIModel ( hObject, aiModel ) ) then
        width = object.getAIVariable ( hObject, aiModel, "objectWidth" )
    end
    
    for i = 0, object.getChildCount ( hObject ) - 1 do        
        width = width + this.getTargetWidth ( object.getChildAt ( hObject, i ) )
    end
    
    return width
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
