--------------------------------------------------------------------------------
--  Handler.......... : onClearCategories
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onClearCategories (  )
--------------------------------------------------------------------------------
	local hSlider = scene.getTaggedObject ( application.getCurrentUserScene( ), "Slider" )
    log.message ( "WARNINGWARNINGWARNINGWARNINGWARNING--- Clearing categories" )
    this.removeAllPaletteThumbnails ( )
    --this.LogToWeb ( "onClearCategories" )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
