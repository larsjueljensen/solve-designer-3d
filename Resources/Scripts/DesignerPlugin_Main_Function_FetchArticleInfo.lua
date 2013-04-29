--------------------------------------------------------------------------------
--  Function......... : FetchArticleInfo
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.FetchArticleInfo ( xmlFile, sName )
--------------------------------------------------------------------------------
	
    
    
    
    
--     local tHulls = user.getAIVariable ( this.getUser ( ), "ASPMain", "tCabinets" )
--     local tFronts = user.getAIVariable ( this.getUser ( ), "ASPMain", "tFronts" )
--     local tSliding = user.getAIVariable ( this.getUser ( ), "ASPMain", "tSliding" )
--     local tStorage = user.getAIVariable ( this.getUser ( ), "ASPMain", "tStorage" )
--     local tShelving = user.getAIVariable ( this.getUser ( ), "ASPMain", "tShelving" )
--     local tAccessories = user.getAIVariable ( this.getUser ( ), "ASPMain", "tAccessories" )
-- 
--     
--     local hWardrobe = xml.getRootElement ( xmlFile )
--     local hArticleList = xml.getElementFirstChildWithName ( hWardrobe, Article )
--     local hArticle3D = xml.getElementChildAt ( hArticleList, 0 )
--     local hArticle3D
--     local hArticleInfo
--     
--     local hArtNumber = xml.getElementChildAt( hArticleInfo, 6 )
-- 
--         log.message ( "Got Article info: ", hArticleInfo )
--         log.message ( "Element name = ", xml.getElementName ( hArticleInfo ) )
--         log.message ( "Got Article number: ", xml.getElementValue ( hArtNumber ) )
--         
--         
--         if ( hArticleList )
--         then    
--             local hChild = xml.getElementFirstChildWithName ( hArticleList, "Article3D" )    
--             while ( hChild )    
--             do
--             
--             table.add ( tHulls, xml.toString ( hChild ) )         
--             --Get next 3d child        
--             hChild = xml.getElementNextSiblingWithName ( hChild, "Article3D" )
--             hArticleInfo = xml.getElementChildAt ( hArticle3D, 0 )
--             local hArtNumber = xml.getElementChildAt( hArticleInfo, 6 )
--             local sValue = xml.getElementValue ( hArtNumber )
--             end
--         end
--         
--         while hArticleInfo == true do
--         
--             if hArticleInfo then
--             local hElement = xml.getElementFirstChildWithName ( hArticleInfo, sName)
--             local sValue = xml.getElementValue ( hArtNumber  )
--             end
--         
--         return  sValue
--         end
-- 	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
