--------------------------------------------------------------------------------
--  Function......... : setSliderColor
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.setSliderColor ( nRed, nGreen, nBlue, nAlpha )
--------------------------------------------------------------------------------

    hud.setComponentBackgroundColor ( hud.getComponent( this.getUser ( ), "Slider.Slide_Container" ), nRed, nGreen, nBlue, nAlpha )	

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------