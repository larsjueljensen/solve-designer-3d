--------------------------------------------------------------------------------
--  Handler.......... : onPopulatePalette
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onPopulatePalette ( sCategory )
--------------------------------------------------------------------------------
    
     local hPaletteItems = hashtable.get( this.htPaletteCache ( ), sCategory  )
     
     this.LogToWeb ( "onPopulatePalette " )
 	--log.message ( "onPopulatePalette: ", hPaletteItems )
     if hPaletteItems ~= nil
     then
         this.LogToWeb ( "Found palette items in local cache" )
 
         local nSize = table.getSize ( hPaletteItems )
         
         for i = 0, nSize - 1 
         do
             local sArticleNumber = table.getAt ( hPaletteItems, i )
             this.LogToWeb ( "Adding thumbnail to palette for article number: "..sArticleNumber )
             this.postEvent ( 0, "onLoadThumbnail", sArticleNumber )
         end
         
     else --No entries in 'htPaletteCache'.
         
         local nXMLStatus = xml.getReceiveStatus ( this.PaletteItemsXML ( ) )
         
         if nXMLStatus == 1 then
             this.LogToWeb ( "XML is loaded: "..xml.toString ( xml.getRootElement ( this.PaletteItemsXML ( ) ) ) )
             
             this.LogToWeb ( "Before CreatePaletteItemsFromXML: " )
             hPaletteItems = this.CreatePaletteItemsFromXML ( this.PaletteItemsXML ( ) )
             this.LogToWeb ( "After CreatePaletteItemsFromXML: " )
             
             local sArticleNumber = table.getAt ( hPaletteItems, 0 )             
             this.LogToWeb ( "Found article in CreatePaletteItemsFromXML: "..sArticleNumber ) 
             
             hashtable.add (  this.htPaletteCache( ), sCategory, hPaletteItems  )
             this.LogToWeb ( "Palette Items added to local cache" )
             this.postEvent ( 0, "onPopulatePalette", sCategory )
             
         elseif nXMLStatus == -1 then
             this.LogToWeb ( "XML not started. " )
 
             xml.receive ( this.PaletteItemsXML ( ), this.BuildPaletteItemsURL ( sCategory ) )
             this.postEvent ( 0, "onPopulatePalette", sCategory )
         elseif nXMLStatus >= 0 then
             this.LogToWeb ( "Loading xml: "..nXMLStatus )
 
             this.postEvent ( 0, "onPopulatePalette", sCategory )
         else 
             this.LogToWeb ( "Error loading xml. Status = "..nXMLStatus )
         
         end
    end
     

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------