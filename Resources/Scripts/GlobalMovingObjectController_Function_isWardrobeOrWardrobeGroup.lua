--------------------------------------------------------------------------------
--  Function......... : isWardrobeOrWardrobeGroup
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.isWardrobeOrWardrobeGroup ( hObject )
--------------------------------------------------------------------------------
	
    if (this.isHelperObject ( hObject, "WardrobeObject" )) then
        return true
    elseif (this.isHelperObject ( hObject, "WardrobeGroup" )) then
        return true
    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
