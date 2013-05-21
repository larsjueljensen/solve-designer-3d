--------------------------------------------------------------------------------
--  Handler.......... : onPopulatePalette
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onPopulatePalette ( sCategory, bStartLoading )
--------------------------------------------------------------------------------
    
     this.LogToWeb ( "onPopulatePalette :"..sCategory )
     
     if bStartLoading then
     
             this.LogToWeb ( "XML not started. " )
             xml.receive ( this.PaletteItemsXML ( ), this.BuildPaletteItemsURL ( sCategory ) )
             this.postEvent ( 0, "onPopulatePalette", sCategory, false )
     
     else
     
        local hPaletteItems = hashtable.get( this.htPaletteCache ( ), sCategory  )
     
        if hPaletteItems ~= nil then

            this.LogToWeb ( "Found palette items in local cache" )

            local nSize = table.getSize ( hPaletteItems )
             
            for i = 0, nSize - 1 
            do
                local sArticleNumber = table.getAt ( hPaletteItems, i )
                this.LogToWeb ( "Adding thumbnail to palette for article number: "..sArticleNumber )
                this.postEvent ( 0, "onLoadThumbnail", sArticleNumber )
            end
             
        else
             
            local nXMLStatus = xml.getReceiveStatus ( this.PaletteItemsXML ( ) )
             
            if nXMLStatus == 1 then
            
                hPaletteItems = this.CreatePaletteItemsFromXML ( this.PaletteItemsXML ( ) )
                hashtable.add (  this.htPaletteCache( ), sCategory, hPaletteItems  )
                this.postEvent ( 0, "onPopulatePalette", sCategory, false )
                 
            elseif nXMLStatus >= 0 then
            
                this.postEvent ( 0, "onPopulatePalette", sCategory, false )
            
            else 
            
                this.LogToWeb ( "Error loading xml. Status = "..nXMLStatus )
                
            end
        end
     end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
