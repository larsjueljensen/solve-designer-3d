--------------------------------------------------------------------------------
--  Handler.......... : onSearchSeriesSelected
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSearchSeriesSelected (  )
--------------------------------------------------------------------------------
    log.message ( "SearchSeries" )
    --log.message ( hComponent )
    
	--hud.setEditText ( hComponent, "" )
    --hud.setComponentForegroundColor ( hComponent, 0, 0, 0, 255 )
    
    this.ResetSearchBox ( this.hSearchBox ( ) )
    
    --Hide window
    
    if this.SearchMode ( ) == 1 then
     hud.callAction ( application.getCurrentUser (  ), "controls.HideSeriesResult" )
    elseif this.SearchMode ( ) == 2 then
     hud.callAction ( application.getCurrentUser (  ), "controls.HideArticleResult" )
	end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
