--------------------------------------------------------------------------------
--  Function......... : removeAllPaletteThumbnails
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.removeAllPaletteThumbnails ( )
--------------------------------------------------------------------------------
    local hThumbnailContainer = hud.getComponent ( application.getCurrentUser ( ), "Slider.Thumbnail_Container" )

    log.message ( "hThumbnailContainer: ", hThumbnailContainer )
    
    
    local nThumbnails = hud.getContainerChildCount ( hThumbnailContainer )
    
    log.message (  "nThumbnails: ", nThumbnails)
    for i = 0, nThumbnails - 1
    do
    
    log.message ( "Kill killll: ", i )
        local hComponent = hud.getContainerChildAt( hThumbnailContainer, 0 )
        
        log.message ( "hComponent: ", hComponent )
        
        hud.destroyComponent ( hComponent )
        
    end
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
