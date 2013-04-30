--------------------------------------------------------------------------------
--  Handler.......... : onGetDescriptionFromElement
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onGetDescriptionFromElement ( sArticleNumber  )
--------------------------------------------------------------------------------
	
    local sXML = hashtable.get ( this.htArticleCache ( ), sArticleNumber )
    
    local sDescription = this.GetDescriptionFromElement ( xml.createFromString ( sXML ) )
	
    log.message ( "sDesc: ", sDescription )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
