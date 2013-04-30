--------------------------------------------------------------------------------
--  Handler.......... : onSearchSeries
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSearchSeries (  )
--------------------------------------------------------------------------------
	
--get component
local hComponent = hud.getUnderCursorComponent ( this.getUser ( ) )

local sText = hud.getEditText ( hComponent )

log.message ( "Searching: ", sText )
this.SearchMode ( 1 )
--Send search string
	
--this.ReceiveSearchSeries ( hComponent )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
