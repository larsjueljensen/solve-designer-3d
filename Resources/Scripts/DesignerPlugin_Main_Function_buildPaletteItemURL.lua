--------------------------------------------------------------------------------
--  Function......... : buildPaletteItemURL
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.buildPaletteItemURL ( sArticleNumber)
--------------------------------------------------------------------------------
	    this.LogToWeb ( "buildPaletteItemURL: "..sArticleNumber )
        local sBaseURL = this.URLbase( )

	    local sPaletteItemURL = sBaseURL.."paletteItem/"..sArticleNumber..".jpg"
        return sPaletteItemURL
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
