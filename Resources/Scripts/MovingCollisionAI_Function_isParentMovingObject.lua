--------------------------------------------------------------------------------
--  Function......... : isParentMovingObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingCollisionAI.isParentMovingObject ( hObject )
--------------------------------------------------------------------------------

    if ( hObject ~= nil ) then
        local hParent = object.getParent ( hObject )
        if ( hParent ~= nil ) then
            return ( string.contains ( object.getModelName ( hParent ), "MovingObject" ) )
        end
    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
