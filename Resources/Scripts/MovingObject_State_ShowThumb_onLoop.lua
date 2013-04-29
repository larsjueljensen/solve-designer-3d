--------------------------------------------------------------------------------
--  State............ : ShowThumb
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.ShowThumb_onLoop ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local nNewCursorValueX, nNewCursorValueY = hud.getCursorPosition ( hUser )

    
    --Match Thumbnail icon with cursor
    local hCursorTools = hud.getComponent ( hUser, "CursorHUD_1.CursorThumb" )
    if hCursorTools then
    hud.setComponentPosition ( hCursorTools, nNewCursorValueX, nNewCursorValueY-10  )
    else end
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
