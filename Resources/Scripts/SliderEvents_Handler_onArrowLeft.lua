--------------------------------------------------------------------------------
--  Handler.......... : onArrowLeft
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onArrowLeft ( sSliderName, bStart )
--------------------------------------------------------------------------------
	    
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Slider" )
    
    if ( hSliderObject ) then
        object.sendEvent ( hSliderObject, "Slider", "onArrowLeft", bStart  )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
