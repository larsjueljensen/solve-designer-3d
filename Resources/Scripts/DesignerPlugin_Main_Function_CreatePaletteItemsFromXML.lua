--------------------------------------------------------------------------------
--  Function......... : CreatePaletteItemsFromXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.CreatePaletteItemsFromXML ( sXML )
--------------------------------------------------------------------------------
    
   -- this.LogToWeb ( "CreatePaletteItemsFromXML: "..xml.toString ( xml.getRootElement ( sXML ) ) )
    
    local hResult = table.newInstance (  )
    local hRoot = xml.getRootElement ( sXML )
    local hPaletteItem = xml.getElementFirstChildWithName ( hRoot, "paletteItem" )
     
     --this.LogToWeb ( "Finding all article numbers in XML data." )
     while (hPaletteItem ~= nil)
     do
         local hArticleInfo = xml.getElementFirstChildWithName ( hPaletteItem, "articleInfo" )
         local sArticleNumber = this.GetArticleNumberFromElement ( hArticleInfo )
         this.LogToWeb ( "Found article number: "..sArticleNumber )
         hashtable.add ( this.htArticleCache ( ), sArticleNumber, xml.toString ( hArticleInfo ) )
         table.add ( hResult,  sArticleNumber )
         hPaletteItem = xml.getElementNextSiblingWithName ( hPaletteItem, "paletteItem" )
   end
   
   return hResult
 
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
