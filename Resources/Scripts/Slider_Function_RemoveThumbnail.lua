--------------------------------------------------------------------------------
--  Function......... : RemoveThumbnail
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.RemoveThumbnail ( sArticleNumber )
--------------------------------------------------------------------------------

    local hUser = application.getCurrentUser ( )
	local hThumbnailContainer = this.getComponent ( "Thumbnail_Container" )
    local tObjectsToRemove = table.newInstance ( )
    
    for i = 0, hud.getContainerChildCount ( hThumbnailContainer ) - 1 do

        local hChild = hud.getContainerChildAt ( hThumbnailContainer, i )
        
        if (this.isThumbnail ( hChild )) then
        
            if ( string.compare ( hud.getComponentBackgroundImageName ( hChild ), sArticleNumber ) == 0 ) then
                table.add ( tObjectsToRemove, hud.getComponentTag ( hChild ) )
                table.add ( tObjectsToRemove, hud.getComponentTag ( this.getThumbnailInfoComponent ( hChild ) ) )
            end        
        end

    end

    for i = 0, table.getSize ( tObjectsToRemove ) - 1 do
        hud.destroyComponent ( hud.getComponent ( application.getCurrentUser ( ), table.getAt ( tObjectsToRemove, i ) ) )
    end
    
    this.nPaletteThumbs ( this.nPaletteThumbs ( ) - 1 )
    
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
