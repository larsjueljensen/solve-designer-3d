--------------------------------------------------------------------------------
--  Function......... : PopulatePaletteWithCategory
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.PopulatePaletteWithCategory ( sCategory )
--------------------------------------------------------------------------------

this.LogToWeb ( "PopulatePaletteWithCategory: "..sCategory )
this.postEvent ( 0, "onPopulatePalette", sCategory )


    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------