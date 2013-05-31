--------------------------------------------------------------------------------
--  Function......... : createSceneObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlReader.createSceneObject (  sArticleNumber, trX, trY, trZ, rX, rY, rZ )
--------------------------------------------------------------------------------
	        
    local hObject = scene.createRuntimeObject ( application.getCurrentUserScene ( ), sArticleNumber )
    object.setTranslation ( hObject, trX, trY, trZ, object.kGlobalSpace )
    object.setRotation ( hObject, rX, rY, rZ, object.kGlobalSpace )

    
    -- TODO: Add AI Models according to type. Perhaps we need to get the type from somewhere?
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
