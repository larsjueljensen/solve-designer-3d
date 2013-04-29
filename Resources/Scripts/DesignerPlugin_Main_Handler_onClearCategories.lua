--------------------------------------------------------------------------------
--  Handler.......... : onClearCategories
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onClearCategories (  )
--------------------------------------------------------------------------------
	local hSlider = scene.getTaggedObject ( application.getCurrentUserScene( ), "Slider" )

    object.sendEvent ( hSlider, "Slider", "onDestroyThumbnail" )
    
    object.setAIVariable ( hSlider, "Slider", "nPaletteThumbs", 0 )
    
    this.LogToWeb ( "onClearCategories" )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------