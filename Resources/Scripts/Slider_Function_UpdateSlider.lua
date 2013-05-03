--------------------------------------------------------------------------------
--  Function......... : UpdateSlider
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.UpdateSlider ( )
--------------------------------------------------------------------------------

	this.nScroolingSpeed ( ( application.getLastFrameTime() * 2 )  * this.CursorPos ( ) + 0.025 )
    
    local nThumbIndex = 0
    local hThumbContainer = this.getComponent ("Thumbnail_Container")
 
    for i = 0, hud.getContainerChildCount ( hThumbContainer ) - 1 do

        local hChild = hud.getContainerChildAt ( hThumbContainer,  i )
        if ( this.isThumbnail (hChild) ) then

            local hCurrentThumbnail = hChild
            local hInfo = this.getThumbnailInfoComponent( hCurrentThumbnail )
            local nCurrentPosition = ( ( nThumbIndex - this.nSliderPosition ( ) ) *  ( 20 ) ) + 30

            if ( ( nCurrentPosition > 0 ) and ( nCurrentPosition < 100 ) ) then
             
                hud.setComponentOpacity ( hCurrentThumbnail, 255 * math.pow (1 - 0.02 * math.abs ( nCurrentPosition - 50 ),1) )
                hud.setComponentVisible ( hCurrentThumbnail, true )
                hud.setComponentPosition( hCurrentThumbnail, nCurrentPosition, 50 ) 

                hud.setComponentOpacity ( hInfo, 255 * math.pow (1 - 0.02 * math.abs ( nCurrentPosition - 50 ),1) )
                hud.setComponentVisible ( hInfo, true )
                hud.setComponentPosition( hInfo, nCurrentPosition - 5, 100 ) 
                
                local nThumbnailWidth, nThumbnailHeight = this.CalculateThumbnailSizes ( nCurrentPosition)
                hud.setComponentSize ( hCurrentThumbnail, nThumbnailWidth, nThumbnailHeight )
 
                if ( ( nCurrentPosition > 40 ) and ( nCurrentPosition < 60 ) ) then
                    this.updateInfoLabel ( hCurrentThumbnail )
                end
                
                if ( ( nCurrentPosition > 40 ) and ( nCurrentPosition < 60 ) ) then
                    hud.setComponentSize ( hInfo,   20, 20 ) 
                else
                    hud.setComponentSize ( hInfo, 15, 15 )
                end
                
            else            
                hud.setComponentVisible ( hCurrentThumbnail, false )
                hud.setComponentVisible ( hInfo, false )
            end

            nThumbIndex = nThumbIndex + 1
        end
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
