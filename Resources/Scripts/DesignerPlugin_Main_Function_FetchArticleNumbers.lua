--------------------------------------------------------------------------------
--  Function......... : FetchArticleNumbers
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.FetchArticleNumbers ( xmlFile )
--------------------------------------------------------------------------------
	
    local hResult = table.newInstance (  )
    local hRoot = xml.getRootElement ( xmlFile )
    local hPaletteItem = xml.getElementFirstChildWithName ( hRoot, "paletteItem" )
    
    while (hPaletteItem)
    do
        local hArticleInfo = xml.getElementFirstChildWithName ( hPaletteItem, "articleInfo" )
        local hArticleNumber = xml.getElementFirstChildWithName ( hArticleInfo, "articleNumber" )
        table.add ( hResult, xml.getElementValue ( hArticleNumber ) )
    end
    
    return hResult

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
