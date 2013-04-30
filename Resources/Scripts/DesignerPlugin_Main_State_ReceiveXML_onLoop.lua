--------------------------------------------------------------------------------
--  State............ : ReceiveXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.ReceiveXML_onLoop ( )
--------------------------------------------------------------------------------
	
	local nXMLStatus = xml.getReceiveStatus ( this.BohusXML( ) )
    
    if ( nXMLStatus == -3 ) then
        log.message ( "Parsing failed. " )
        
        this.Idle ( )
        
        elseif ( nXMLStatus == -2 ) then
        
        log.message ( "File not found. " )
        
        this.Idle ( )
        
        elseif ( nXMLStatus == -1 ) then
        
        log.message ( "Not started. " )
        
        this.Idle ( )

        
        elseif ( nXMLStatus == 1 ) then
        
        log.message ( xml.toString ( xml.getRootElement ( this.BohusXML ( ) ) ) )
        
        --do stuff.
        
        
        this.Idle ( )
        
        end
    
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
