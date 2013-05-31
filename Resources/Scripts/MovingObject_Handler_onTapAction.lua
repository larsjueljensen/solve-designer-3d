--------------------------------------------------------------------------------
--  Handler.......... : onTapAction
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onTapAction ( nTapTime, nCount, nButton )
--------------------------------------------------------------------------------
    
    local hIsHUD = hud.getUnderCursorComponent ( this.getUser ( ) )
    
    if ( this.nLatestTapTime ( ) == nTapTime ) then
        if hIsHUD == nil then
            if ( nCount == 1 ) then
                this.SingleTap ( )
            elseif ( nCount == 2 ) then
                this.DoubleTap ( )
            end
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
