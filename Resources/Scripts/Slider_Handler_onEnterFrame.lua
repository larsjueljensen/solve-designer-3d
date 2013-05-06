--------------------------------------------------------------------------------
--  Handler.......... : onEnterFrame
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.onEnterFrame (  )
--------------------------------------------------------------------------------
	
    
    local hUser = application.getCurrentUser ( )
    local nMode = user.getAIVariable ( hUser, "ASPMain", "nSliderMode" )
    
    local nCursorX = hud.getCursorPosition ( hUser )
    this.CursorPos( math.abs( nCursorX - 50 ) / 50 ) 

    if (this.nSliderScrolling ( ) ~= 0) then
        --log.message ( "PALETTE SCROLLING BACK ON" )
         if ( this.nSliderScrolling ( ) == 1 ) then 
            --scroll to the right
            this.nSliderPosition ( math.min ( this.nPaletteThumbs( )  - 1 - this.nSliderMargin ( ), 
                                              this.nSliderPosition ( ) + this.nScroolingSpeed ( )   ) )
        elseif (this.nSliderScrolling ( ) == -1) then
            --scroll to the left
            this.nSliderPosition ( math.max ( 0 - this.nSliderMargin ( ), 
                                              this.nSliderPosition ( ) - this.nScroolingSpeed ( )   ) )
        end
        
        this.UpdateSlider ( )
    end


--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
