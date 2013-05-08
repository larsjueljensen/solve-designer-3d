--------------------------------------------------------------------------------
--  Function......... : getArticleInfoElementFromArticleNumber
--  Author........... : Lars Juel Jensen
--  Description...... : Returns the cached <articleInfo> document given it's article number
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.getArticleInfoElementFromArticleNumber ( sArticleNumber )
--------------------------------------------------------------------------------
	
    local hArticleInfoElement = xml.newInstance ( )
    local htArticleInfoCache = user.getAIVariable ( this.getUser ( ), "DesignerPlugin_Main", "htArticleCache" )
    xml.createFromString ( hArticleInfoElement, hashtable.get ( htArticleInfoCache, sArticleNumber ) )
    return xml.getRootElement ( hArticleInfoElement )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
