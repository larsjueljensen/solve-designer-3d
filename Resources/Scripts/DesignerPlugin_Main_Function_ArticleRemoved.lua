--------------------------------------------------------------------------------
--  Function......... : ArticleRemoved
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.ArticleRemoved ( sArticleID )
--------------------------------------------------------------------------------
	
    local sArticleInfo = xml.toString ( hashtable.get( this.htArticleCache ( ), sArticleID ) )
    this.LogToWeb ( "ArticleRemoved - "..sArticleInfo )
    --system.openURL ( "javascript:onArticleRemoved("..sArticleInfo..");" )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
