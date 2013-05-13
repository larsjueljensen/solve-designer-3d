--------------------------------------------------------------------------------
--  Function......... : destroyItems
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.destroyItems ( )
--------------------------------------------------------------------------------
	
	local hHolder = hud.getComponent ( this.getUser ( ), "main.ArticleInfoWindow" )

    for i = 0, hud.getContainerChildCount ( hHolder ) - 1
    do
        local hChild = hud.getComponentAt( this.getUser ( ), 0 )
        hud.destroyComponent ( hChild )
	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
