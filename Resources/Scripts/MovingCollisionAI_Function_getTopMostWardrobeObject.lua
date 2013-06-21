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
    
    log.warning ( "ABCDEFG!" )
    
    repeat
        log.warning ( "!" )
        hResult = hNext
        hNext = this.getNextWardrobeObject ( hNext )
    until hNext == nil
    
    if ( this.isWardrobeObject ( hResult ) ) then
        log.warning ( "@" )
        return hResult
    end
    
    log.warning ( "nil" )
    return nil
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
