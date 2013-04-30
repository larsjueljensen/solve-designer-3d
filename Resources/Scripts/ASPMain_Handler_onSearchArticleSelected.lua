--------------------------------------------------------------------------------
--  Handler.......... : onSearchArticleSelected
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSearchArticleSelected (  )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser (  )
    --log.message ( "ClearText" )
    --log.message ( hComponent )
    
	--hud.setEditText ( hComponent, "" )
    --hud.setComponentForegroundColor ( hComponent, 0, 0, 0, 255 )
    
    
    --Hide window
    
    if this.SearchMode ( ) == 1 then
     hud.callAction ( hUser, "controls.HideArticleResult" )
     
     local sSearchString = hud.getEditText ( hud.getComponent ( this.getUser ( ), "controls.SearchSeries" ) )
     log.message ( "Search string: ", sSearchString )

    elseif this.SearchMode ( ) == 2 then
    hud.callAction ( hUser , "controls.HideSeriesResult" )
    local sSearchString = hud.getEditText ( hud.getComponent ( this.getUser ( ), "controls.SearchArticle" ) )

    log.message ( "Search string: ", this.SearchMode ( ), "   ", sSearchString )
    
    local sString = string.lower ( sSearchString )
    
    if string.compare ( sString, "living" ) then
    
    --Create search result.
    
    hud.callAction ( hUser, "HUD_sidemenu.ShowConfigObjWnd" )
    
    
    
    else
    
    end

    this.ResetSearchBox ( this.hSearchBox ( ) )
     
     
     
     
	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
