--------------------------------------------------------------------------------
--  Handler.......... : onArrowRight
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onArrowRight ( sSliderName, bStart )
--------------------------------------------------------------------------------
	
    --forward the event to the slider    
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Slider" )
    --log.message ( "*******************************************Arrow Right: ", bStart  )

    if ( hSliderObject ) then 
        object.sendEvent ( hSliderObject, "Slider", "onArrowRight", bStart  )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
