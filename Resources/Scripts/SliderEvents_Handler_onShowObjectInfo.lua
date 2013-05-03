--------------------------------------------------------------------------------
--  Handler.......... : onShowObjectInfo
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onShowObjectInfo (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    
    --Get button
    --
    local hInfoButton = hud.getUnderCursorComponent ( hUser )
    
    log.message ( "Info click: ", hInfoButton )
    
    --GetPosition
    --
    local nBtnX, nBtnY = hud.getComponentScreenSpaceCenter( hInfoButton  )
        
    log.message ( "Button pos: ", nBtnX, "  " , nBtnY )
    
	local hThumbnail = hud.getComponentAtPoint ( hUser, nBtnX + 4 , nBtnY -5  )
    
    log.message ( "Thumbnail value: ", hThumbnail )
    
    local sSelection = hud.getComponentBackgroundImageName ( hThumbnail )
    log.message ( "Show info for: ", sSelection  )
    
    local hWindow = hud.getComponent ( hUser, "main.ArticleInfoWindow" )
    
    --Get object text strings by sending request to Solve using GET
    --
    
    --Set window text values.
    --
    --Show window
    --
    user.sendEvent ( hUser, "ArticleInfoAI", "onShowArticleInfo", sSelection )
    hud.setComponentVisible ( hWindow, true )
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
