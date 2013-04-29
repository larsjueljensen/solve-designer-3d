--------------------------------------------------------------------------------
--  State............ : GetPaletteItems
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.GetPaletteItems_onLoop ( )
--------------------------------------------------------------------------------
	
    local nXMLStatus = xml.getReceiveStatus ( this.PaletteItemsXML( ) )
    
    
        if ( nXMLStatus == -3 ) then
        log.message ( "Parsing failed. " )
        this.LogToWeb ( "Parsing failed. " )
        this.Idle ( )
        this.LogToWeb ( "nXMLStatus = "..nXMLStatus )

        
        elseif ( nXMLStatus == -2 ) then
        
        log.message ( "File not found. " )
        this.LogToWeb ( "File not found." )
        this.Idle ( )
        this.LogToWeb ( "nXMLStatus = "..nXMLStatus )

        
        elseif ( nXMLStatus == -1 ) then
        
        log.message ( "Not started. " )
        this.LogToWeb ( "Not started.  " )
        this.Idle ( )
        this.LogToWeb ( "nXMLStatus = "..nXMLStatus )


        
        elseif ( nXMLStatus == 1 ) then
        
        local sXML = xml.toString ( xml.getRootElement ( this.PaletteItemsXML( ) ))
        this.LogToWeb ( "nXMLStatus = "..sXML )
        
        
        this.Idle ( )
        
        end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
