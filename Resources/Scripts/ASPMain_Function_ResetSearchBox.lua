--------------------------------------------------------------------------------
--  Function......... : ResetSearchBox
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.ResetSearchBox ( )
--------------------------------------------------------------------------------
	
    log.message ( "Reset Search" )
    local hComponent = hud.getComponent ( application.getCurrentUser ( ), this.sSearchBoxID ( ) )
    
    log.message ( this.sSearchBoxID ( ) )
    hud.setComponentForegroundColor ( hComponent, 100, 100, 100, 255 )

    if this.SearchMode ( ) == 1 then
	
        hud.setEditText ( hComponent, "Søk serie" )
    
    elseif this.SearchMode ( ) == 2 then 
	
        hud.setEditText ( hComponent, "Søk artikkel" )
    
    end
    
    this.SearchMode ( 0 )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
