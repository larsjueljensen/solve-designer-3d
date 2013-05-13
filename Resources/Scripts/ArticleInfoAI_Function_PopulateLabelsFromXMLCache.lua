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
    local sArticleInfo = hashtable.get ( htCache, sArticleNumber )
    local tTable = table.newInstance ( )
    xml.createFromString ( hXml, sArticleInfo )    
    local hRoot = xml.getRootElement ( hXml )    
    
    table.add ( tTable, "Bredde" )
    table.add ( tTable, "Håyde" )
    table.add ( tTable, "Dybde" )    
    table.add ( tTable, "Farge" )
    table.add ( tTable, "Material" )
    table.add ( tTable, "EAN" )
    table.add ( tTable, "Art.nr" )
    
    for i = 0, nLines-1 do
        xml.getElementChildAt ( hRoot, i )
        local hElement = xml.getElementChildAt ( hRoot, i )
        local vValue = xml.getElementValue ( hElement )
        this.SetLabelText ( table.getAt ( tTable, i ), vValue, i )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
