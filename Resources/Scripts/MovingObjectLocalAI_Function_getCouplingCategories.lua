--------------------------------------------------------------------------------
--  Function......... : getCouplingCategories
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectLocalAI.getCouplingCategories ( sArticleNumber )
--------------------------------------------------------------------------------
	
    local htArticleCache = user.getAIVariable ( application.getCurrentUser ( ), "DesignerPlugin_Main", "htArticleCache" )
    local hCouplingCategories = table.newInstance ( )

    local hXML = xml.newInstance ( )
    local sXML = hashtable.get ( htArticleCache, sArticleNumber )
    xml.createFromString ( hXML, sXML )
    
    local hCatListElement = xml.getElementFirstChildWithName ( xml.getRootElement (  hXML ), "connectCategories" )
    local hCategoryElement = xml.getElementFirstChildWithName ( hCatListElement, "category" )
    
    while (hCategoryElement ~= nil) do
        table.add ( hCouplingCategories, xml.getElementValue ( hCategoryElement ) )
        hCategoryElement = xml.getElementNextSiblingWithName ( hCategoryElement, "category" )
    end
    
    return hCouplingCategories
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
