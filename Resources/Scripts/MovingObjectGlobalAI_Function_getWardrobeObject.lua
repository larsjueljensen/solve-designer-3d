--------------------------------------------------------------------------------
--  Function......... : getWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.getWardrobeObject ( hObject )
--------------------------------------------------------------------------------

    local hResult = hObject
    
    while ( hResult ~= nil ) do
        
        if ( string.contains ( object.getModelName ( hResult ), "Wardrobe" ) ) then
        
            return hResult
        
        end
        
        hResult = object.getParent ( hResult )
    end
    
    return nil
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
