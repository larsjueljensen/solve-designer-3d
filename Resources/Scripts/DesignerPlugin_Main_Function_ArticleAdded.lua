--------------------------------------------------------------------------------
--  Function......... : ArticleAdded
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.ArticleAdded ( sID, sArticleNumber )
--------------------------------------------------------------------------------
    log.message ( "ArticleAdded (  ) = ", sArticleNumber )
    
    if sArticleNumber ~= nil then
        local sArticleInfo =  hashtable.get( this.htArticleCache ( ), sArticleNumber ) 
        this.LogToWeb ( "ArticleAdded - "..sArticleInfo )
        system.openURL ( "javascript:onArticleAdded("..sID..", '"..sArticleInfo.."');", "" )
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
