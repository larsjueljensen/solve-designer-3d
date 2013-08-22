--------------------------------------------------------------------------------
--  Function......... : getHighlightableObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.getHighlightableObject ( hHitObject )
--------------------------------------------------------------------------------

    local hResult = hHitObject
    
    while ( hResult ~= nil ) do
        if ( this.isHighlightableObject ( hResult ) ) then
            return hResult
        end
        
        hResult = object.getParent ( hResult )
    end

    return nil;
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
