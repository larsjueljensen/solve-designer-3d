--------------------------------------------------------------------------------
--  Function......... : buildFromArticle3DElement
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlReader.buildFromArticle3DElement ( hArticle3DElement )
--------------------------------------------------------------------------------

    this.createSceneObjectFromArticle3DElement( hArticle3DElement )    

    local hChildArticle3DElement = xml.getElementFirstChildWithName ( hArticle3DElement, "article3D" )
    
    while ( hChildArticle3DElement ~= nil ) do
        this.buildFromArticle3DElement ( hChildArticle3DElement )
        hChildArticle3DElement = xml.getElementNextSiblingWithName ( "article3D" )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
