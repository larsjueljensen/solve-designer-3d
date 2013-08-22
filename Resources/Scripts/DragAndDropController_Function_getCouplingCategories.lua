--------------------------------------------------------------------------------
--  Function......... : getCouplingCategories
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Example of articleInfo XML structure
--------------------------------------------------------------------------------
--  <articleInfo>
--      <width>50cm</width>
--      <height>219cm</height>
--      <depth>60cm</depth>
--      <color>mørkgrå</color>
--      <type>D3D_HULL</type>
--      <material>MDF</material>
--      <ean>5707252042301</ean>
--      <articleNumber>134517</articleNumber>
--      <price>NOK 799.00</price>
--      <description>Z-UP Garderobe skrog 50 MDF M.grå</description>
--      <connectCategories>
--        <category>CAT_A</category>
--      </connectCategories>
--  </articleInfo>
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.getCouplingCategories ( sArticleNumber )
--------------------------------------------------------------------------------
	
    local htArticleCache = user.getAIVariable ( this.getUser ( ), "DesignerPlugin_Main", "htArticleCache" )
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
