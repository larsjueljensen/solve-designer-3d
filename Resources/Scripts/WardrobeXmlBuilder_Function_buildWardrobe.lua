--------------------------------------------------------------------------------
--  Function......... : buildWardrobe
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.buildWardrobe ( hScene )
--------------------------------------------------------------------------------

    local hWardrobeXml, hXml = this.createNewElement ( "wardrobe" )
        
    for i = 0, scene.getObjectCount ( hScene ) - 1 do
        local hObject = scene.getObjectAt ( hScene, i )
        if this.isArticleObject( hObject ) and not this.hasParent ( hObject ) then
            xml.appendElementChildElement ( hWardrobeXml, this.buildArticle3D ( hObject ) )
        end
    end
        
    return xml.toString ( hWardrobeXml )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
