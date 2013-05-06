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
    hud.callAction ( this.getUser ( ), "main.ShowArticleInfo" )
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
