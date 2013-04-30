--------------------------------------------------------------------------------
--  State............ : SaveXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.SaveXML_onLoop ( )
--------------------------------------------------------------------------------
	
    local nXMLStatus = xml.getSendStatus ( this.BohusXML( ) )
    
    log.message ( nXMLStatus )
    
    if ( nXMLStatus == -3 ) then
        log.message ( "Could not save failed. " )
        
        this.Idle ( )
        
        elseif ( nXMLStatus == -2 ) then
        
        log.message ( "File not found. " )
        
        this.Idle ( )
        
--         elseif ( nXMLStatus == - 1 )then
--         
--         this.Idle()
--         
        elseif ( nXMLStatus  == 1 )  then
        
        log.message ( "Data saved. " )
        
        this.Idle ( )
        
        end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
