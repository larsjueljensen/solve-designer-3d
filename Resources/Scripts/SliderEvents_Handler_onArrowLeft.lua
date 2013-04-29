--------------------------------------------------------------------------------
--  Handler.......... : onArrowLeft
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onArrowLeft ( sSliderName, bStart )
--------------------------------------------------------------------------------
	
    --forward the event to the slider    
    
    --log.message ( "*******************************************Arrow left, slider: ", bStart  )
    
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Slider" )
    if ( hSliderObject ) then
        object.sendEvent ( hSliderObject, "Slider", "onArrowLeft", bStart  )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
