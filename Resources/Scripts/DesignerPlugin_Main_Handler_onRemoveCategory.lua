--------------------------------------------------------------------------------
--  Handler.......... : onRemoveCategory
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onRemoveCategory ( sCategory )
--------------------------------------------------------------------------------
	this.LogToWeb ( "onRemoveCategory: "..sCategory )
	this.RemoveCategoryFromPalette ( sCategory )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------