--------------------------------------------------------------------------------
--  Handler.......... : onClearThumbnails
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.onClearThumbnails (  )
--------------------------------------------------------------------------------
	
    local hThumbnailContainer = this.getComponent ( "Thumbnail_Container" ) 
    local nThumbnails = hud.getContainerChildCount ( hThumbnailContainer )
    
    for i = 0, nThumbnails - 1
    do
        hud.destroyComponent ( hud.getContainerChildAt( hThumbnailContainer, 0 ) )
    end
    
    this.nPaletteThumbs ( 0 )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
