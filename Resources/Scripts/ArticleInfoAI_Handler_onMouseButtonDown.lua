--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
	if hud.getUnderCursorComponent ( this.getUser ( ) ) == nil --close info window if clicked outside infopopup
    then
    hud.callAction ( this.getUser ( ), "main.QuitInfoClick" )
	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
