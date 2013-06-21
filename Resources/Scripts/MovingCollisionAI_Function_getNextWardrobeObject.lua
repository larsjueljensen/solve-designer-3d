--------------------------------------------------------------------------------
--  Function......... : getNextWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingCollisionAI.getNextWardrobeObject ( hObject )
--------------------------------------------------------------------------------
	
    local hResult = object.getParent ( hObject )
    
    while ( hResult ~= nil ) do

        if (this.isWardrobeObject ( hResult )) then
            return hResult
        end
        
        hResult = object.getParent ( hResult )
        
    end
    
    return nil
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
