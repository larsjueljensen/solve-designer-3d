--------------------------------------------------------------------------------
--  Function......... : ClearText
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.ClearText ( hComponent )
--------------------------------------------------------------------------------
	
    log.message ( "ClearText" )
    log.message ( hComponent )
    
	hud.setEditText ( hComponent, "" )
    hud.setComponentForegroundColor ( hComponent, 0, 0, 0, 255 )
    
    local sName = hud.getComponentTag ( hComponent )
    
    local sEdit1 = "controls.SearchSeries"
    local sEdit2 = "controls.SearchArticle"
    
    
       
    this.sSearchBoxID ( sName )
    
    if sName == sEdit1 then
    log.message ( "ClearText sName. ", sName  )
    this.SearchMode ( 1 )
    
    elseif sName == sEdit2 then
    
    log.message ( "ClearText sName. ", sName  )
    this.SearchMode ( 2 )

   
    end
        
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
