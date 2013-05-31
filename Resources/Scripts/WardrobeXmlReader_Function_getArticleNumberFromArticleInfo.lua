--------------------------------------------------------------------------------
--  Function......... : getArticleNumberFromArticleInfo
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlReader.getArticleNumberFromArticleInfo ( hArticleInfoElement )
--------------------------------------------------------------------------------

    local hArticleNumberElement = xml.getElementFirstChildWithName ( hArticleInfoElement, "articleNumber" )
    return xml.getElementValue ( hArticleNumberElement )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
