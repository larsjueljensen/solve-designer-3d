--------------------------------------------------------------------------------
--  Function......... : HideHUD
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.HideHUD ( )
--------------------------------------------------------------------------------
	
	hud.destroyTemplateInstance ( this.getUser ( ), "main" )
    hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "Slider.LowMenuHolder" ), false )

	
    
    
	--this.TakeSnapshot ( )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------