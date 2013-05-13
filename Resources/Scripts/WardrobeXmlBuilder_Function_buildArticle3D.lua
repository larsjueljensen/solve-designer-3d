--------------------------------------------------------------------------------
--  Function......... : buildArticle3D
--  Author........... : Lars Juel Jensen
--  Description...... : Builds xml element of type <article3D> with children
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.buildArticle3D ( hObject )
--------------------------------------------------------------------------------
	
    local sArticleNumber = object.getAIVariable ( hObject, "CommonObjectProperties", "articleNumber" )
    local hArticleElement = this.createNewElement ( "article3D" )
    
    xml.appendElementChildElement ( hArticleElement, this.buildVector ( hObject, "position", object.getTranslation ) )
    xml.appendElementChildElement ( hArticleElement, this.buildVector ( hObject, "rotation", object.getRotation ) )
    xml.appendElementChildElement ( hArticleElement, this.getArticleInfoElementFromArticleNumber ( sArticleNumber ) )
    
    for i = 0, object.getChildCount ( hObject ) - 1 do

        local hChildObject = object.getChildAt ( hObject, i )
        if (this.isArticleObject( hChildObject )) then
            xml.appendElementChildElement ( hArticleElement, this.buildArticle3D ( hChildObject ) )
        end       
    end
    
    return hArticleElement
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
