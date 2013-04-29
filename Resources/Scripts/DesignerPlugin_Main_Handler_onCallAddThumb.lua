--------------------------------------------------------------------------------
--  Handler.......... : onCallAddThumb
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onCallAddThumb (  )
--------------------------------------------------------------------------------
	
	local hSlider = user.getAIVariable ( application.getCurrentUser ( ), "ASPMain", "hSliderObject" )
	--log.message ( "onCallAddThumb: ", hSlider )
    object.sendEvent ( hSlider, "Slider" ,"onAddThumbnail", "117768" )
    
    
    
    
    --scene.createRuntimeObject ( application.getCurrentUserScene ( ), "117767/117767" )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
