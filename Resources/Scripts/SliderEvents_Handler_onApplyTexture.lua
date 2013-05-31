--------------------------------------------------------------------------------
--  Handler.......... : onApplyTexture
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onApplyTexture (  )
--------------------------------------------------------------------------------

    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Slider" )

    if ( hSliderObject ) then 
        local sSliderName = this.sSlider ( )
        local sTextureName = this.sTexture ( )
        object.sendEvent ( hSliderObject, "Slider", "onChooseTexture", sSliderName, sTextureName  )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
