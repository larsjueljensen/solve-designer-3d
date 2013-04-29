--------------------------------------------------------------------------------
--  Function......... : BuildPaletteItemsURL
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.BuildPaletteItemsURL ( sCategory )
--------------------------------------------------------------------------------
    this.LogToWeb ( "BuildPaletteItemsURL("..sCategory..")" )

	local sBaseURL = this.URLbase( )
    local queryString = this.commonQueryString ( )
    
    local sPaletteItemsURL = sBaseURL.."paletteItems.xml?"..queryString.."&categories="..sCategory
    
    return sPaletteItemsURL 

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
