--------------------------------------------------------------------------------
--  Handler.......... : onAddThumbnail
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.onAddThumbnail ( sTextureName )
--------------------------------------------------------------------------------
    this.LogToWeb ( "onAddThumbnail" )
    local hUser = application.getCurrentUser ( )
    local nMode = user.getAIVariable ( hUser, "ASPMain", "nSliderMode" )
    this.nSliderMode( nMode )
    
    if sTextureName ~=  nil then
        this.CreateThumbnail ( this.nPaletteThumbs ( ),  sTextureName )
    end
	
--------------------------------------------------------------------------------
end    

--------------------------------------------------------------------------------
