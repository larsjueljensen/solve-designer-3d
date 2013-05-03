--------------------------------------------------------------------------------
--  Function......... : PopulateLabelsFromXMLCache
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.PopulateLabelsFromXMLCache ( sArticleNumber, nLines )
--------------------------------------------------------------------------------
	
	local htCache = user.getAIVariable ( this.getUser ( ), "DesignerPlugin_Main", "htPaletteCache" )
    local hXml = xml.newInstance ( )
    local sArticleInfo = hashtable.get ( htCache, sArticleNumber )
    
    xml.createFromString ( hXml, sArticleInfo )
    
    
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
