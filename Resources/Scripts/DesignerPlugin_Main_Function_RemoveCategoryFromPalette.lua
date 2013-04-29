--------------------------------------------------------------------------------
--  Function......... : RemoveCategoryFromPalette
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.RemoveCategoryFromPalette ( sCategory )
--------------------------------------------------------------------------------
	
    local hSlider = scene.getTaggedObject ( application.getCurrentUserScene( ), "Slider" )

    local hPaletteItems = hashtable.get( this.htPaletteCache ( ), sCategory  ) 
	
    this.LogToWeb ( "RemoveCategoryFromPalette: "..hPaletteItems )
    
    if hPaletteItems ~= nil
    then
        local nSize = table.getSize ( hPaletteItems )
    
        for i = 0, nSize -1
        do
            local hElement = table.getAt ( hPaletteItems, i )
            this.LogToWeb ( "RemoveCategoryFromPalette :"..hElements )
            local sArticleNumber = this.GetArticleNumberFromElement ( hElement )
            this.LogToWeb ( "RemoveCategoryFromPalette: "..hPaletteItems )

            object.sendEvent ( hSlider , "Slider", "onDestroyThumbnail", sArticleNumber )
        end

    
    end
    
    

    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
