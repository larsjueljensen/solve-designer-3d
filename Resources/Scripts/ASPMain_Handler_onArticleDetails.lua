--------------------------------------------------------------------------------
--  Handler.......... : onArticleDetails
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onArticleDetails (  )
--------------------------------------------------------------------------------
	
	
    --get handle to detailwindow.
    
    local hWnd = hud.getComponent ( application.getCurrentUser ( ), "HUD_sidemenu.Wnd_ArticleDetails" )
    
    --TODO: get article data.
    
    hud.setComponentVisible ( hWnd, true )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
