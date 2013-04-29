--------------------------------------------------------------------------------
--  Function......... : ParseXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.ParseXML ( )
--------------------------------------------------------------------------------
	
	local hXML = this.BohusXML ( )
    
    local hWardrobe = xml.getRootElement ( hXML )
    
    
  
    local hArticleList = xml.getElementChildAt ( hWardrobe, 0 )
    local hArticle3D = xml.getElementChildAt ( hArticleList, 0 )
    local hArticle3D = xml.getElementChildAt ( hArticleList, 0 )
    local hArticleInfo = xml.getElementChildAt ( hArticle3D, 0 )
    
    log.message ( "Got wardrobe: ", hWardrobe )
    log.message ( "Attirbute name = ", xml.getElementName ( hWardrobe ) )
    
    log.message ( "Got ArticleList: ", hArticleList )
    log.message ( "Element name = ", xml.getElementName ( hArticleList ) )
    
    log.message ( "Got Article 3D entry: ", hArticleList )
    log.message ( "Element name = ", xml.getElementName ( hArticle3D ) )
   
    --//----------------------------------
    --GetArticle info
    --//----------------------------------
        log.message ( "Got Article info: ", hArticleInfo )
        log.message ( "Element name = ", xml.getElementName ( hArticleInfo ) )
        
        --//----------------------------------
    --GetArticle position data
    --//----------------------------------
    
    local hMaterial = xml.getElementChildAt ( hArticleInfo, 4 )
    local sMat = xml.getElementValue ( hMaterial )
        log.message ( "Info fetch test = ", xml.getElementName ( hMaterial ) )
        log.message ( "Info fetch test = ", sMat )
    --//---------------------------
    --Get connection category
    --//---------------------------
    

    
    
    
    --Get data.
    --
    
    local nX, nY, nZ
    
    local hPosX = xml.getElementNextSibling ( hArticleInfo )
    nX = xml.getElementValue ( hPosX )
    
    local hPosY = xml.getElementNextSibling ( hPosX )
    nY = xml.getElementValue ( hPosY )
    
    local hPosZ = xml.getElementNextSibling ( hPosY )
    nZ = xml.getElementValue ( hPosZ )
    
    local hRotation = xml.getElementNextSibling ( hPosZ )
    local nRotation  = xml.getElementValue ( hRotation )

    
    log.message ( "XML pos data: ", nX," ", nY, " ", nZ )
    
    
    local sObjectToLoad = this.FetchArticleInfo ( "articleNumber" )
    
    log.message ( "Fetch article info returnm: ", sObjectToLoad )
    
    this.AddArticle ( sObjectToLoad , nX, nY, nZ )
    
    

    
--     if hRoot then
--     local nCount = xml.getElementChildCount ( hRoot )
--     
--     log.message ( "RootElementChildCount: ", nCount )
--         --Get first child element
--         --
--         for i = 0, nCount - 1    
--         do
--         local hChild = xml.getElementChildAt ( hRoot, i )
--         --table.add ( this.tChildren ( ), xml.toString ( hChild1 ) )    
--         --log.message ( this.tChildren ( ), xml.toString ( hChild1 ) ) 
--         log.message ( "Root child element ",i,": ", hChild )
--         
--             if hChild then
--             local nCount = xml.getElementChildCount ( hChild )
--             log.message ( "ChildElementChildCount: ", nCount )
--             
--                     for i = 0, nCount - 1    
--                     do
--                     local hChild = xml.getElementChildAt ( hRoot, i )
--                     --table.add ( this.tChildren ( ), xml.toString ( hChild1 ) )    
--                     --log.message ( this.tChildren ( ), xml.toString ( hChild1 ) ) 
--                     log.message ( "Root child element ",i,": ", hChild )
-- 
-- 
--             
-- 
--             
--             
--         
--         
--         
--         
--         end
--         log.message ( "XML root: ", hRoot )
--         log.message ( "Attirbute name = ", xml.getElementName ( hRoot ) )
-- 
--	end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------