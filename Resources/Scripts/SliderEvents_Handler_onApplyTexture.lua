--------------------------------------------------------------------------------
--  Handler.......... : onApplyTexture
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onApplyTexture (  )
--------------------------------------------------------------------------------
	
    log.message ("function SliderEvents.onApplyTexture (  )"  )
    
     local sSliderName = this.sSlider ( )
     local sTextureName = this.sTexture ( )
     
     
    log.message ("sSliderName: ",  sSliderName   )
    log.message ("sTextureName: ", sTextureName  )
    local hTarget = user.getAIVariable ( application.getCurrentUser ( ), "MovingObject", "hSelectedObject" ) 

    --forward the event to the slider    
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Slider" )
    if ( hSliderObject ) then 
        object.sendEvent ( hSliderObject, "Slider", "onChooseTexture", sSliderName, sTextureName  )
        --object.sendEvent ( hTarget, "SliderTarget", "onChangeTexture","white"  )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
