--------------------------------------------------------------------------------
--  Function......... : getThumbnailInfoComponent
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.getThumbnailInfoComponent ( hThumbnail )
--------------------------------------------------------------------------------

    local sTag = hud.getComponentTag ( hThumbnail )
    return hud.getComponent ( application.getCurrentUser ( ), string.replace ( sTag, "Thumbnail", "ThumbnailInfo" ) )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
