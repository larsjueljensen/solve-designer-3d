--------------------------------------------------------------------------------
--  Function......... : CreateItemsFromXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.CreateItemsFromXML ( )
--------------------------------------------------------------------------------
	
	local sXML = this.PaletteItemsXML ( )
    
    this.LogToWeb ( "CreatePaletteItemsFromXML: "..sXML )
    
--     local hResult = table.newInstance (  )
--     local hRoot = xml.getRootElement ( sXML )
--     local hPaletteItem = xml.getElementFirstChildWithName ( hRoot, "paletteItem" )
--     
--     while (hPaletteItem)
--     do
--         local hArticleInfo = xml.getElementFirstChildWithName ( hPaletteItem, "articleInfo" )
--         local sArticleNumber = this.GetArticleNumberFromElement ( hArticleInfo )
--         hashtable.set ( this.htArticleCache ( ), sArticleNumber, hArticleInfo )
--         table.add ( hResult,  hArticleInfo  )
--     end
--     
--     return hResult
-- 	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
