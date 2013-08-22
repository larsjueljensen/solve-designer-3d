--------------------------------------------------------------------------------
--  Function......... : getTopmostWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectLocalAI.getTopmostWardrobeObject ( hObject )
--------------------------------------------------------------------------------

    local hResult = this.getWardrobeObject ( hObject )
    
    if (hResult ~= nil) then
        local hParent = object.getParent ( hResult )
        
        while (hParent ~= nil) do
            local hCurrent = this.getWardrobeObject ( hParent )
            if (hCurrent ~= nil) then
                hResult = hCurrent
                hParent = object.getParent ( hCurrent )
            else
                hParent = nil
            end
        end
    end
    
    return hResult
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
