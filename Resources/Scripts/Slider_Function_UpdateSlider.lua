--------------------------------------------------------------------------------
--  Function......... : UpdateSlider
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.UpdateSlider ( )
--------------------------------------------------------------------------------
	local nDt  = application.getLastFrameTime()
    this.nScroolingSpeed ( ( nDt * 2 )  * this.CursorPos ( ) + 0.025 ) 
	
    for i = 0, this.nPaletteThumbs ( ) - 1
    do
        local hCurrentThumbnail = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".Thumbnail"..i )
        if ( hCurrentThumbnail )
        then
        local hInfo = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".ThumbnailInfo"..i )
            local nCurrentPosition = ( ( i - this.nSliderPosition ( ) ) *  ( 20 ) ) + 30 -- / ( nDt*100 ) 
            --log.message ( "Cutrent slider pos = ", nCurrentPosition )
             if ( ( nCurrentPosition > 0 ) and ( nCurrentPosition < 100 ) ) then
            
                --hud.setComponentOpacity ( hCurrentThumbnail, 255 * (1 - 0.02 * math.abs ( nCurrentPosition - 50 )) ) --linear fade thumbnail on borders
                hud.setComponentOpacity ( hCurrentThumbnail, 255 * math.pow (1 - 0.02 * math.abs ( nCurrentPosition - 50 ),1) ) --expo fade thumbnail on borders
                hud.setComponentVisible ( hCurrentThumbnail, true )
                hud.setComponentPosition( hCurrentThumbnail, nCurrentPosition, 50 ) 

                hud.setComponentOpacity ( hInfo, 255 * math.pow (1 - 0.02 * math.abs ( nCurrentPosition - 50 ),1) ) --expo fade thumbnail on borders
                hud.setComponentVisible ( hInfo, true )
                hud.setComponentPosition( hInfo, nCurrentPosition-5, 100 ) 





                --local nSizeThumbX = 255 * math.pow (1 - 0.02 * math.abs ( nCurrentPosition - 50 )
                        
                --Resize thumb and infobutton
                --
                if ( ( nCurrentPosition > 40 ) and ( nCurrentPosition < 60 ) )
                then
                hud.setComponentSize ( hCurrentThumbnail,   80, 80)
                
                
                
                this.updateInfoLabel ( hCurrentThumbnail )
                else
                   hud.setComponentSize ( hCurrentThumbnail, 50,50 )

                end
                
                --Resize thumb and infobutton
                --
                if ( ( nCurrentPosition > 40 ) and ( nCurrentPosition < 60 ) )
                then
                  hud.setComponentSize ( hInfo,   20, 20 ) 

                else
                   hud.setComponentSize ( hInfo, 15, 15 ) 

                end
                
                
                
                
                
                
            else            
                hud.setComponentVisible ( hCurrentThumbnail, false )
                hud.setComponentVisible ( hInfo, false )

            end
        end
    end
    
--     local hTimer = hud.getTimerAt ( application.getCurrentUser ( ), 0 )
--     
--     hud. ( hTimer  )
-- 
    --hud.callAction ( application.getCurrentUser( ), "MoveObjectHUD.StartTimer"  )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
