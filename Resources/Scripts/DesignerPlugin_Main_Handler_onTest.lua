--------------------------------------------------------------------------------
--  Handler.......... : onTest
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onTest (  )
--------------------------------------------------------------------------------
	local hScene = application.getCurrentUserScene ( )
    
    local  sArticleNumber = "fabric16"
    this.LogToWeb ( "onPutMoneyOnWall "..sArticleNumber  )
    
    local sFilename = sArticleNumber--..".jpg"
	local hWall = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall1" )
    shape.overrideMeshMaterialEffectMap0 ( object.getChildAt(  hWall, 0 ), sFilename, shape.kMapTypeTexture )
    
    local hSlider = scene.getTaggedObject ( hScene, "Slider" )
    
    object.sendEvent ( hSlider, "Slider", "onAddThumbnail", sArticleNumber )
    
    local sFilename = sArticleNumber..".jpg"
	--this.LogToWeb ( "getFileContentAsString "..cache.getFileContentAsString ( sArticleNumber )  )
	--this.LogToWeb ( "getFileSize "..cache.getFileProperty ( sFilename, cache.kPropertySize )  )
	--this.LogToWeb ( "getFileSize "..cache.getFileProperty ( sFilename, cache.kPropertySize )  )
    log.message ( "Wall object: ", object.getChildAt( hWall, 0 ) )
    
    
   
    --log.message ( scene.getObjectTag ( object.getChildAt( 0, hWall ) ) )
    
   --scene.getTaggedObject ( application.getCurrentUserScene ( ),  )
    
    --this.LogToWeb ( "getFileHright "..cache.getFileProperty ( sFilename, cache.kPropertyHeight )  )
	--this.LogToWeb ( "getFileWidth "..cache.getFileProperty ( sFilename, cache.kPropertyWidth )  )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
