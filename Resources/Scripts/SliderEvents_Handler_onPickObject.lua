--------------------------------------------------------------------------------
--  Handler.......... : onPickObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onPickObject ( sSliderName, sTextureName )
--------------------------------------------------------------------------------

    user.sendEvent ( this.getUser ( ), "MovingObject", "onPickObject", sSliderName, sTextureName )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
