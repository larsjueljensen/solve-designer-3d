--------------------------------------------------------------------------------
--  Function......... : isHighlightableObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.isHighlightableObject ( hObject )
--------------------------------------------------------------------------------

    if ( this.isHelperObject ( hObject, "WardrobeObject" ) ) then
        return true
    end
    
    if ( this.isHelperObject ( hObject, "WardrobeGroup" ) ) then
        return true
    end

    if ( this.isMovingObject ( hObject ) ) then
        return true
    end
	
    return false
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
