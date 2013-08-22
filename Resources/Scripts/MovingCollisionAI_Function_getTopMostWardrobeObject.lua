--------------------------------------------------------------------------------
--  Function......... : getTopMostWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingCollisionAI.getTopMostWardrobeObject ( hObject)
--------------------------------------------------------------------------------

    local hNext = hObject
    local hResult
        
    repeat
        hResult = hNext
        hNext = this.getNextWardrobeObject ( hNext )
    until hNext == nil
    
    if ( this.isWardrobeObject ( hResult ) ) then
        return hResult
    end
    
    return nil
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
