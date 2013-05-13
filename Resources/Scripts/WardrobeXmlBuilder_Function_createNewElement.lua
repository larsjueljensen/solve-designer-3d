--------------------------------------------------------------------------------
--  Function......... : createNewElement
--  Author........... : Lars Juel Jensen
--  Description...... : Constructs a new xml and returns the root node and the xml 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.createNewElement ( sName )
--------------------------------------------------------------------------------

    local hXml = xml.newInstance ( )
    xml.createFromString ( hXml, "<"..sName.."/>" )
    return xml.getRootElement ( hXml ), hXml
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
