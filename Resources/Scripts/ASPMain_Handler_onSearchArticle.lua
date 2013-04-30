--------------------------------------------------------------------------------
--  Handler.......... : onSearchArticle
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSearchArticle (  )
--------------------------------------------------------------------------------

--get component
local hComponent = hud.getUnderCursorComponent ( this.getUser ( ) )

local sText = hud.getEditText ( hComponent )

log.message ( "Searching: ", sText )


this.SearchMode ( 2 ) 

--this.ReceiveSearchArticle ( hComponent )


--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
