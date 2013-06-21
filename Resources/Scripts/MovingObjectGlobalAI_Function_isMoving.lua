--------------------------------------------------------------------------------
--  Function......... : isMoving
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.isMoving ( hObject )
--------------------------------------------------------------------------------

    local hWardrobeObject = this.getWardrobeObject ( hObject )

    if ( hWardrobeObject ~= nil ) then
        local hParent = object.getParent ( hWardrobeObject )
        if (hParent ~= nil) then
            return string.contains ( object.getModelName ( hParent ), "MovingObject" )
        end
    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
