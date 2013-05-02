--------------------------------------------------------------------------------
--  Function......... : RemoveThumbnail
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.RemoveThumbnail ( sArticleNumber )
--------------------------------------------------------------------------------

    local hUser = application.getCurrentUser ( )
	local hThumbnailContainer = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".Thumbnail_Container" )
    local tObjectsToRemove = table.newInstance ( )

    for i = 0, hud.getContainerChildCount ( hThumbnailContainer ) - 1 do

        local hThumbNailObject = hud.getContainerChildAt ( hThumbnailContainer, i )

        if ( string.compare ( hud.getComponentBackgroundImageName ( hThumbNailObject ), sArticleNumber ) ) == 0 then

            local sTag = hud.getComponentTag ( hThumbNailObject )
            log.message ( "The thumbnail component tag is: "..sTag )
            local posTag =  string.replace ( sTag, "Slider.Thumbnail", "" )
            log.message ( "The position tag is: "..posTag )
            table.add ( tObjectsToRemove, posTag )

        end

        i = i + 1
    end

    

    for i = 0, table.getSize ( tObjectsToRemove ) - 1 do

        local sId = table.getAt ( tObjectsToRemove, i )
        local sThumbnailTag = ( this.sSliderName ( )..".Thumbnail"..sId )
        local sInfoTag = ( this.sSliderName ( )..".ThumbnailInfo"..sId )

        log.message ( "Thumbnail tag: "..sThumbnailTag)
        log.message ( "Info tag: "..sInfoTag )

        local hCurrentThumbnail = hud.getComponent ( application.getCurrentUser ( ), sThumbnailTag )
        local hInfo = hud.getComponent ( application.getCurrentUser ( ), sInfoTag )

        log.message ( "Thumbnail handle: ", hCurrentThumbnail )
        log.message ( "Info handle: ", hInfo )

        hud.destroyComponent ( hCurrentThumbnail )
        hud.destroyComponent ( hInfo )
    end
    
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
