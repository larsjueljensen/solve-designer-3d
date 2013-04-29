--------------------------------------------------------------------------------
--  Function......... : CalculateObjectToWall
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.CalculateObjectToWall ( hObject , nImdex)
--------------------------------------------------------------------------------
	local hScene = application.getCurrentUserScene ( )
    local hTarget = scene.getTaggedObject ( hScene, "target" )
    local x, y, z
    
	if hObject ~= nil then
           local xObjMin, yObjMin, zObjMin = object.getBoundingBoxMin ( this.hMovingObject ( ) )
           local xObjMax, yObjMax, zObjMax = object.getBoundingBoxMax ( this.hMovingObject ( ) )
           
           local xObjCenter, yObjCenter, zObjCenter = object.getBoundingSphereCenter ( hObject )
           
           log.message (  "xObjMin, yObjMin, zObjMin: ",  xObjMin,"  " ,yObjMin,"  " ,zObjMin )
           log.message (  "xObjMax, yObjMax, zObjMax: ",  xObjMax,"  " ,yObjMax,"  " ,zObjMax )
           log.message (  "xCenter, yCenter, zCenter: ",  xObjCenter ,"  " ,yObjCenter ,"  " ,zObjCenter )
           
           --get object size
           --
           
           local nSizeX = xObjMax - xObjMin
           local nSizeY = yObjMax - yObjMin
           local nSizeZ = zObjMax - zObjMin
           
           log.message ( "nSizeX = ", nSizeX )
           log.message ( "nSizeY = ", nSizeY )
           log.message ( "nSizeZ = ", nSizeZ )
           
           local nTargetX, nTargetY, nTargetZ = object.getTranslation ( hTarget, object.kGlobalSpace )
           
           
    end
    
    return x, y, z

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------