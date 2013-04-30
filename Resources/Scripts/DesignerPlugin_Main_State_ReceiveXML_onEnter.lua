--------------------------------------------------------------------------------
--  State............ : ReceiveXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.ReceiveXML_onEnter ( )
--------------------------------------------------------------------------------
	
    
    
    --get file status in cache.
    --
     xml.receive ( this.BohusXML ( ), "Bohus.xml" )
     
     local nStatus = xml.getReceiveStatus ( this.BohusXML ( ) )
    --local nStatus = cache.getFileStatus ( "Bohus.xml" )
    log.message ( "File status in cache =", nStatus )
    
    --xml.receive ( this.BohusXML ( ), "" )
   
    
   
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
