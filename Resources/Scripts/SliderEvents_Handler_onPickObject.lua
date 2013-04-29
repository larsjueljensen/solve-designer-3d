--------------------------------------------------------------------------------
--  Handler.......... : onPickObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onPickObject ( sSliderName, sTextureName )
--------------------------------------------------------------------------------
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), sSliderName )
    
    user.sendEvent ( this.getUser ( ), "MovingObject", "onPickObject", sSliderName, sTextureName )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
