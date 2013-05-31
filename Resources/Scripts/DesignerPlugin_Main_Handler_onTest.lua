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
    local sFilename = sArticleNumber--..".jpg"
	local hWall = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall1" )
    shape.overrideMeshMaterialEffectMap0 ( object.getChildAt(  hWall, 0 ), sFilename, shape.kMapTypeTexture )
    
    local hSlider = scene.getTaggedObject ( hScene, "Slider" )
    object.sendEvent ( hSlider, "Slider", "onAddThumbnail", sArticleNumber )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
