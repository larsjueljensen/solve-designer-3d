--------------------------------------------------------------------------------
--  Function......... : PopulateLabelsFromXMLCache
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.PopulateLabelsFromXMLCache ( sArticleNumber, nLines )
--------------------------------------------------------------------------------
	
	local htCache = user.getAIVariable ( this.getUser ( ), "DesignerPlugin_Main", "htArticleCache" )
    local hXml = xml.newInstance ( )
    log.message ( "Received sArticleNumber: ", sArticleNumber )
    log.message ( "htArticleCache :  ", htCache)
    local sArticleInfo = hashtable.get ( htCache, sArticleNumber )
    
    log.message ( "sArticleInfo = ", sArticleInfo )
    xml.createFromString ( hXml, sArticleInfo )
    
    local hRoot = xml.getRootElement ( hXml )
    
    log.message ( xml.toString ( hRoot ) )
    
    for i = 0, nLines-1 do
        xml.getElementChildAt ( hRoot, i )
        

        local hElement = xml.getElementChildAt ( hRoot, i )
        local sElementName = xml.getElementName ( hElement )
        local vValue = xml.getElementValue ( hElement )
        log.message ( "Element = ", sElementName, " has value ", vValue )
        this.SetLabelText ( sElementName, vValue, i )
        
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
