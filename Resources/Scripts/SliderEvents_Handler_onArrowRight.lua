--------------------------------------------------------------------------------
--  Handler.......... : onArrowRight
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onArrowRight ( sSliderName, bStart )
--------------------------------------------------------------------------------
	
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Slider" )

    if ( hSliderObject ) then 
        object.sendEvent ( hSliderObject, "Slider", "onArrowRight", bStart  )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
