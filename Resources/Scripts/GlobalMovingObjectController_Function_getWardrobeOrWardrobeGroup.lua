--------------------------------------------------------------------------------
--  Function......... : getWardrobeOrWardrobeGroup
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.getWardrobeOrWardrobeGroup ( hObject )
--------------------------------------------------------------------------------
	
    local hResult = hObject
    
    while ( hResult ~= nil ) do
        if (this.isWardrobeOrWardrobeGroup ( hResult )) then
            return hResult
        end
        
        hResult = object.getParent ( hResult )
    end
    
    return hResult
  	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
