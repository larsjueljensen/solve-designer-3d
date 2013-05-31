--------------------------------------------------------------------------------
--  Function......... : getHighlightableObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.getHighlightableObject ( hHitObject )
--------------------------------------------------------------------------------

    if ( hHitObject ~= nil ) then

        local hResult = hHitObject
        local hParent = object.getParent ( hResult )
        
        while ( hParent ~= nil ) do
            hResult = hParent
            hParent = object.getParent ( hParent )
        end

        if ( this.isHighlightableObject ( hResult ) ) then
            return hResult
        end
    end
    
    return nil;
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
