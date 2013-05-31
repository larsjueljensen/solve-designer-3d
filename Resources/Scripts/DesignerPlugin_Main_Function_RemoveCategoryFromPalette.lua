--------------------------------------------------------------------------------
--  Function......... : RemoveCategoryFromPalette
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.RemoveCategoryFromPalette ( sCategory )
--------------------------------------------------------------------------------
	
    local tArticleNumbers = hashtable.get( this.htPaletteCache ( ), sCategory  ) 
    
    if tArticleNumbers ~= nil then

        local hSlider = scene.getTaggedObject ( application.getCurrentUserScene( ), "Slider" )
    
        for i = 0, table.getSize ( tArticleNumbers ) -1 do
            local sArticleNumber = table.getAt ( tArticleNumbers, i )
            object.sendEvent ( hSlider , "Slider", "onDestroyThumbnail", sArticleNumber )
        end
        
    end
  
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
