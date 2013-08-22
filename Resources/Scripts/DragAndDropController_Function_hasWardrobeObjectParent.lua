--------------------------------------------------------------------------------
--  Function......... : hasWardrobeObjectParent
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.hasWardrobeObjectParent ( hObject )
--------------------------------------------------------------------------------
	
    local hParent = object.getParent ( hObject )
    
    while (hParent ~= nil) do 
        if (this.isHelperObject ( hParent, "WardrobeObject" )) then
            return true
        end
        
        hParent = object.getParent ( hParent )
    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
