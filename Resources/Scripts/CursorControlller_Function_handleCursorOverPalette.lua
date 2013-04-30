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
    
        --update slider left  
        this.setSliderColor ( 100, 100, 127, 255 )        
        user.sendEvent ( hUser, "SliderEvents", "onArrowLeft", "MySlider", true )
        --user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
    elseif nPointX > 0.20 then
        this.setSliderColor ( 50, 100, 40, 255 )
        user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", true )
        --user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )
    else
        this.setSliderColor ( 127, 127, 127, 255 )
        user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
        user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )                 
    end
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
