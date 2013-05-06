--------------------------------------------------------------------------------
--  Function......... : destroyItems
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.destroyItems ( )
--------------------------------------------------------------------------------
	
	local hHolder = hud.getComponent ( this.getUser ( ), "main.ArticleInfoWindow" )
    
    local nChildComponents = hud.getContainerChildCount ( hHolder )
    log.message ( "Destroying info items" )
    for i = 0, nChildComponents - 1
    do
        local hChild = hud.getComponentAt( this.getUser ( ), i )
        hud.destroyComponent ( hChild )
	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
