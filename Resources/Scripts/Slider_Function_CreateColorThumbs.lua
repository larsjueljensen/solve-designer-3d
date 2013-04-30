--------------------------------------------------------------------------------
--  Function......... : CreateColorThumbs
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.CreateColorThumbs ( nPosition, sTextureName )
--------------------------------------------------------------------------------
	
	log.message ( "LOGMESSAGE In createThumbnail" )
    
    local hUser = application.getCurrentUser ( )
    local nAttributeID = this.nSliderMode( )
    log.message( "Create thumb, Attribute = ", nAttributeID)
    --Create furniture texturethumbs
    
	local hThumbnail_Container = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".Thumbnail_Container" )
   
    local hThumbnail = hud.newComponent ( application.getCurrentUser ( ), hud.kComponentTypeButton, this.sSliderName ( )..".Thumbnail0"..nPosition )    
    
    
    log.message ( "Thumbnailpos: ", nPosition )
    log.message ( "Thumbnailtexture: ", sTextureName )
    log.message ( "hThumbnail: ", hThumbnail )
    log.message ( "sTextureName: ", sTextureName )
    log.message ( "hThumbnail_Container: ", hThumbnail_Container )
    
    local nAttribute = user.getAIVariable ( hUser, "aspmenu_AI", "nSliderMode" )
    
    log.message( "Got nAttibute. ", nAttribute)
    
    if ( hThumbnail_Container and hThumbnail ) 
    then
        --create a new thumbnail, child of the thumbnail container
        --create invisible, the function UpdateSlider will decide which thumbnail are displayed
        
        hud.setComponentContainer       ( hThumbnail, hThumbnail_Container )
        hud.setComponentOrigin          ( hThumbnail, hud.kOriginCenter )
        hud.setComponentAspectInvariant ( hThumbnail, true )        
        hud.setComponentVisible         ( hThumbnail, false )  
        hud.setComponentSize            ( hThumbnail, 80, 80 )        
        hud.setComponentForegroundColor ( hThumbnail, 127,127,127, 255 ) 
        hud.setComponentBorderColor ( hThumbnail, 127,127,127, 255 )
        hud.setComponentOpacity ( hThumbnail, 255 )
        
        if nAttribute == 7 then
        log.message ( "Creating paint thumbnail" )
        else
        
        
        hud.setComponentBackgroundColor ( hThumbnail, 127,127,127, 255 )
        hud.setComponentBackgroundImage ( hThumbnail, sTextureName )--.."_thumb"  
        end
        
        
        
        --create a new action for this button to apply the texture when we click on it
        local hThumbnailClickedAction = hud.newAction ( application.getCurrentUser ( ), this.sSliderName ( ).."ThumbnailClickedAction0"..nPosition )
        if ( hThumbnailClickedAction ) then        
            hud.beginActionCommand          ( hThumbnailClickedAction, hud.kCommandTypeSendEventToUser ) 
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, application.getCurrentUser ( ) )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, "SliderEvents" )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, "onChooseTexture" )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, this.sSliderName ( ) )
            hud.pushActionCommandArgument   ( hThumbnailClickedAction, sTextureName )
            hud.endActionCommand            ( hThumbnailClickedAction )          
            hud.setButtonOnClickedAction    ( hThumbnail, hThumbnailClickedAction )
        end
        hashtable.add ( this.aThumbnail ( ), this.sSliderName ( )..".Thumbnail0"..nPosition, sTextureName )
        
    end
    

    --hashtable.add ( this.aThumbnail ( ), this.sSliderName ( )..".Thumbnail0"..nPosition, sTextureName )
    this.UpdateSlider ( )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
