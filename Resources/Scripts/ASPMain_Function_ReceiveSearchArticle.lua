--------------------------------------------------------------------------------
--  Function......... : ReceiveSearchArticle
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.ReceiveSearchArticle ( hComponent )
--------------------------------------------------------------------------------
	
    --Empty Searchlist
    --hud.removeListAllItems ( hud.getComponent ( this.getUser ( ), "controls.ArticleResult" ) )
    
    
	--Read XML
    
    --Create entries.
    
    
    
    
    for i = 0, 15 do
        
        hud.addListItem ( hud.getComponent ( this.getUser ( ), "controls.ArticleResult" ), "Artikkel: "..i )
    
    end
    
    
    
    
    --Show results.
    hud.callAction ( this.getUser ( ),"controls.ShowArticleResults" )
    
    
    
    
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
