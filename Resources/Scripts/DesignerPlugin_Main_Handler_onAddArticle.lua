--------------------------------------------------------------------------------
--  Handler.......... : onAddArticle
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onAddArticle (  sID, sArticleNumber )
--------------------------------------------------------------------------------
	
    log.message ( "onAddArticle: "..sID )
    this.LogToWeb ( "onAddArticle: "..sID )
    
    --local sArticleNumber = user.getAIVariable ( this.getUser ( ), "MovingObject" , "sAddedArticle" )
    
    log.message( "movingobject_sArticleAdded = ", sArticleNumber )
    this.ArticleAdded ( sID, sArticleNumber )

    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
