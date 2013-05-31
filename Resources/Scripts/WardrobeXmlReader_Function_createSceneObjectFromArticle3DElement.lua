--------------------------------------------------------------------------------
--  Function......... : createSceneObjectFromArticle3DElement
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlReader.createSceneObjectFromArticle3DElement ( hArticle3DElement )
--------------------------------------------------------------------------------
	
    local trX, trY, trZ = this.getVector ( hArticle3DElement, "position" )
    local rX, rY, rZ = this.getVector ( hArticle3DElement, "rotation" )
    
    local hArticleInfoElement = xml.getElementFirstChildWithName ( hArticle3DElement, "articleInfo" )
    local sArticleNumber = this.getArticleNumberFromArticleInfo( hArticleInfoElement )
    
    this.sendEvent ( "onCreateSceneObject", sArticleNumber, trX, trY, trZ, rX, rY, rZ )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
