--------------------------------------------------------------------------------
--  Function......... : getArticleType
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.getArticleType ( sArticleNumber )
--------------------------------------------------------------------------------
	
    local htArticleCache = user.getAIVariable ( this.getUser ( ), "DesignerPlugin_Main", "htArticleCache" )

    local hXML = xml.newInstance ( )
    local sXML = hashtable.get ( htArticleCache, sArticleNumber )
    xml.createFromString ( hXML, sXML )
    
    local hTypeElement = xml.getElementFirstChildWithName ( xml.getRootElement (  hXML ), "type" )
    return xml.getElementValue ( hTypeElement )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
