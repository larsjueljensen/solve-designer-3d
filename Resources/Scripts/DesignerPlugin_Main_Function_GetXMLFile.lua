--------------------------------------------------------------------------------
--  Function......... : GetXMLFile
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.GetXMLFile ( )
--------------------------------------------------------------------------------
	
    
    xml.receive ( this.BohusXML ( ), "file:///C:/XML/Bohus.xml"  )
    
	local nStatus = cache.getFileStatus ( "Bohus.xml" )
    --local nStatus2 = cache.getFileStatus ( "Bohus" ) 
    local nStatus3 = xml.getReceiveStatus ( this.BohusXML ( ) )
    local nStatus4 = cache.getFileStatus ( "Bohus" )
    
    
    
    
    log.message ( "GetXMLFIle: Status = ", nStatus )
    --log.message ( "GetXMLFIle: Status = ", nStatus2 )
    log.message ( "GetXMLFIle: Status = ", nStatus3 )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
