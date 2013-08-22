--------------------------------------------------------------------------------
--  Function......... : getWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.getWardrobeObject ( hObject )
--------------------------------------------------------------------------------

    local hResult = hObject

    repeat

        if (this.isHelperObject ( hResult, "WardrobeObject" )) then
            return hResult
        end
        
        hResult = object.getParent ( hResult )
    	
    until ( hResult == nil )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
