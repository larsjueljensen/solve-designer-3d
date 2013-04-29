--------------------------------------------------------------------------------
--  Function......... : UpdateXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.UpdateXML ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    local hXML = this.BohusXML ( )
    
    local hWardrobe = xml.getRootElement ( hXML )
    
    --Get loaded object from list.
    --
    local tTable = user.getAIVariable ( hUser, "MovingObject", "tObjectGroup" )
    
    local nTableSize = table.getSize ( tTable )
    
    log.message ( "got table: ", tTable )
    
    local sTag = table.getAt ( tTable, 0 )
    
    log.message ( sTag )
    
    log.message ( "UpdateXML: ", sTag )
    
    if sTag ~= nil then
    local hObject = scene.getTaggedObject ( hScene, sTag  )
    
   
    
    log.message ( "Got new object: ", hObject)
  
    local hArticleList = xml.getElementChildAt ( hWardrobe, 0 )
    local hArticle3D = xml.getElementChildAt ( hArticleList, 0 )
    local hArticleInfo = xml.getElementChildAt ( hArticle3D, 0 )
    
    local nObjX, nObjY, nObjZ = object.getTranslation ( hObject, object.kGlobalSpace  )
    
    
    
    --get elements.
    --
    local hPosX = xml.getElementChildAt ( hArticle3D, 1 )
    local hPosY = xml.getElementChildAt ( hArticle3D, 2 )
    local hPosZ = xml.getElementChildAt ( hArticle3D, 3 )
    
    xml.setElementName( hArticle3D, sTag )

    --Set XML values
    --
    
    
    --create XML entry.
    -- 
     
    xml.setElementValue ( hPosX, ""..nObjX )
    xml.setElementValue ( hPosY, ""..nObjY )
    xml.setElementValue ( hPosZ, ""..nObjZ )
    
    --local hNewEntry = xml.copy (  )
    
     end
    
   -- xml.appendElementAttribute ( hArticle3D, "ObjectID", "balle" )
    --xml.appendElementChildElement ( hArticleList, hArticle3D )
    --xml.appendElementChild ( hArticleList, sTag   )
    --xml.setElementName (  )

    
    --this.SaveXML ( )
    
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
