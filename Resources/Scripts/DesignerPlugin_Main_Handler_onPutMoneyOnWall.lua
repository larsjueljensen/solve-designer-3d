--------------------------------------------------------------------------------
--  Handler.......... : onPutMoneyOnWall
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onPutMoneyOnWall ( sArticleNumber )
--------------------------------------------------------------------------------
	this.LogToWeb ( "onPutMoneyOnWall "..sArticleNumber  )
	local hWall = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall1" )
    
    local sFilename = sArticleNumber..".jpg"
	this.LogToWeb ( "getFileSize "..cache.getFileProperty ( sFilename, cache.kPropertySize )  )
	this.LogToWeb ( "getFileSize "..cache.getFileProperty ( sFilename, cache.kPropertySize )  )
   
    
    this.LogToWeb ( "getFileHright "..cache.getFileProperty ( sFilename, cache.kPropertyHeight )  )
	this.LogToWeb ( "getFileWidth "..cache.getFileProperty ( sFilename, cache.kPropertyWidth )  )

    shape.overrideMeshMaterialEffectMap0 ( object.getChildAt(  hWall, 0 ), sArticleNumber, shape.kMapTypeTexture )
   

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
