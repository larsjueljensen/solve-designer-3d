--------------------------------------------------------------------------------
--  Function......... : handleCursorOverPalette
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.handleCursorOverPalette ( nPointX )
--------------------------------------------------------------------------------
	local hUser = this.getUser ( )
    
    if nPointX < -0.20 then    
        user.sendEvent ( hUser, "SliderEvents", "onArrowLeft", "MySlider", true )
    elseif nPointX > 0.20 then
        user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", true )
    else
        log.message ( "PALETTE SCROLLING OFF2" )
        --user.setAIVariable ( this.getUser ( ), "Slider", "nSliderScrolling", 0 )
        user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )

    end
                 

    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
