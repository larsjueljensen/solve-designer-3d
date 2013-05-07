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
    
    
    --GetPosition
    --
    local nBtnX, nBtnY = hud.getComponentScreenSpaceCenter( hInfoButton  )
	local hThumbnail = hud.getComponentAtPoint ( hUser, nBtnX + 4 , nBtnY -5  )
    local sSelection = hud.getComponentBackgroundImageName ( hThumbnail )
    local hWindow = hud.getComponent ( hUser, "main.ArticleInfoWindow" )
    user.sendEvent ( hUser, "ArticleInfoAI", "onShowArticleInfo", sSelection )
    
    
    if this.ArticleInfoIsVisible ( ) == true then
    hud.callAction ( this.getUser ( ), "main.QuitInfoClick" )
    this.ArticleInfoIsVisible ( false )
    else
    hud.callAction ( this.getUser ( ), "main.ShowArticleInfo" )
    this.ArticleInfoIsVisible ( true )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
