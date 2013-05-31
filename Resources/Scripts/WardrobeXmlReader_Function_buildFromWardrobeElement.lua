--------------------------------------------------------------------------------
--  Function......... : buildFromWardrobeElement
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlReader.buildFromWardrobeElement ( hWardrobeElement )
--------------------------------------------------------------------------------
	
    local hArticle3DElement = xml.getElementFirstChildWithName ( "article3D" );
    
    while ( hArticle3DElement ~= nil ) do    
        this.buildFromArticle3DElement( hArticle3DElement )    
        hArticle3DElement = xml.getElementNextSiblingWithName ( hArticle3DElement, "article3D" )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
