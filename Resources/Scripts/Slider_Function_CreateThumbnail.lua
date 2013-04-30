--------------------------------------------------------------------------------
--  Function......... : CreateThumbnail
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.CreateThumbnail ( nPosition, sTextureName )
--------------------------------------------------------------------------------
	
    
    local hUser = application.getCurrentUser ( )
    local nAttributeID = this.nSliderMode( )
	local hThumbnail_Container = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".Thumbnail_Container" )
   
    local hThumbnail = hud.newComponent ( application.getCurrentUser ( ), hud.kComponentTypeButton, this.sSliderName ( )..".Thumbnail"..nPosition )
    
    local hInfo = hud.newComponent ( application.getCurrentUser ( ), hud.kComponentTypeButton, this.sSliderName ( )..".ThumbnailInfo"..nPosition )
    
    local nAttribute = user.getAIVariable ( hUser, "ASPMain", "nSliderMode" )
     
   
    if ( hThumbnail_Container and hThumbnail ) 
    then
        --create a new thumbnail, child of the thumbnail container
        --create invisible, the function UpdateSlider will decide which thumbnail are displayed
        
        hud.setComponentContainer       ( hThumbnail, hThumbnail_Container )
        hud.setComponentOrigin          ( hThumbnail, hud.kOriginCenter )
        hud.setComponentAspectInvariant ( hThumbnail, true )        
        hud.setComponentVisible         ( hThumbnail, false )  
        hud.setComponentSize            ( hThumbnail, 50, 50 )        
        hud.setComponentForegroundColor ( hThumbnail, 127,127,127, 255 ) 
        hud.setComponentBorderColor ( hThumbnail, 127,127,127, 255 )
        hud.setComponentOpacity ( hThumbnail, 255 )
        
        --Lag thumb info-knapp.
        --
        hud.setComponentContainer       ( hInfo, hThumbnail_Container )
        hud.setComponentOrigin          ( hInfo, hud.kOriginTopRight )
        hud.setComponentAspectInvariant ( hInfo, true )        
        hud.setComponentVisible         ( hInfo, false )  
        hud.setComponentSize            ( hInfo, 15, 15)        
        hud.setComponentForegroundColor ( hInfo, 127,127,127, 255 ) 
        hud.setComponentBorderColor ( hInfo, 127,127,127, 0 )
        hud.setComponentOpacity ( hInfo, 255 )
        hud.setComponentZOrder ( hInfo, 130 )
        hud.setComponentBackgroundImage ( hInfo, "info_ring" )
        
        if nAttribute == 7 then
        log.message ( "Creating paint thumbnail" )
        hud.setComponentBackgroundColor ( hThumbnail, 127,127,127, 255 )
        hud.setComponentBackgroundImage ( hThumbnail, sTextureName )--.."_thumb"  
        
        log.message ( "Setting thumbnail bg gfx: ", sTextureName )

        else
        
        
        hud.setComponentBackgroundColor ( hThumbnail, 127,127,127, 255 )
        hud.setComponentBackgroundImage ( hThumbnail, sTextureName )--.."_thumb"  
        
        log.message ( "Setting thumbnail bg gfx: ", sTextureName )
        end
        
        --create a new action for this button to apply the texture when we click on it
        local hThumbnailClickedAction = hud.newAction ( application.getCurrentUser ( ), this.sSliderName ( ).."ThumbnailClickedAction0"..nPosition )
        
        if ( hThumbnailClickedAction ) then        
            hud.beginActionCommand          ( hThumbnailClickedAction, hud.kCommandTypeSendEventToUser ) 
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, application.getCurrentUser ( ) )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, "SliderEvents" )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, "onPickObject" )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, this.sSliderName ( ) )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, sTextureName )
            hud.endActionCommand            ( hThumbnailClickedAction )          
            hud.setButtonOnClickAction    ( hThumbnail, hThumbnailClickedAction )
        end
        --hashtable.add ( this.aThumbnail ( ), this.sSliderName ( )..".Thumbnail0"..nPosition, sTextureName )
        
        --create a new action for info button to show textwindow etc... click on it
        local hThumbnailInfoClickedAction = hud.newAction ( application.getCurrentUser ( ), this.sSliderName ( ).."ThumbnailInfoClickedAction"..nPosition )
        
        if ( hThumbnailInfoClickedAction ) then        
            hud.beginActionCommand          ( hThumbnailInfoClickedAction, hud.kCommandTypeSendEventToUser ) 
            hud.pushActionCommandArgument   ( hThumbnailInfoClickedAction, application.getCurrentUser ( ) )
            hud.pushActionCommandArgument   ( hThumbnailInfoClickedAction, "SliderEvents" )
            hud.pushActionCommandArgument   ( hThumbnailInfoClickedAction, "onShowObjectInfo" )
            hud.pushActionCommandArgument   ( hThumbnailInfoClickedAction, this.sSliderName ( ) )
            hud.pushActionCommandArgument   ( hThumbnailInfoClickedAction, sTextureName )
            hud.endActionCommand            ( hThumbnailInfoClickedAction )          
            hud.setButtonOnClickedAction    ( hInfo, hThumbnailInfoClickedAction )
        end
        
        --hashtable.add ( this.aThumbnail1 ( ), this.sSliderName ( )..".ThumbnailInfo"..nPosition, sTextureName )

    end
    

    --hashtable.add ( this.aThumbnail ( ), this.sSliderName ( )..".Thumbnail0"..nPosition, sTextureName )
    this.nPaletteThumbs ( nPosition + 1 ) 
    this.UpdateSlider ( )
    
    
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
