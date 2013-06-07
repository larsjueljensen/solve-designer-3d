--------------------------------------------------------------------------------
--  Function......... : calculateRayCastCorrAngle
--  Author........... : Lars Juel Jensen
--  Description...... : Called on mouse button down to correct 
--                        movement according to user's grab position
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.calculateRayCastCorrAngle ( hObject, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    local x, y, z = object.getTranslation ( hObject, object.kGlobalSpace )
    
    local roomWidth = user.getAIVariable ( this.getUser ( ), "ASPMain", "RoomWidth" )
    local roomDepth = user.getAIVariable ( this.getUser ( ), "ASPMain", "RoomLength" )
    local objectWidth = object.getAIVariable ( hObject, "MovingObjectGlobalAI", "objectWidth" )
    local objectDepth = object.getAIVariable ( hObject, "MovingObjectGlobalAI", "objectDepth" )

    local hScene = application.getCurrentUserScene ( )
    local hHitObject, nHitDist, nHitSurfaceID, cx, cy, cz, i, j, k = scene.getFirstHitColliderEx ( hScene, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
    local sColliderTag = scene.getObjectTag ( hScene, hHitObject )
    
    
    local cx, cz
    
    -- If we hit the wall initially in front of the camera
    if ( string.contains ( sColliderTag, "Wall1" ) ) then
        
        cx = x / (1 - (objectWidth / (10 * roomWidth)))
        cz = z - 0.5 * objectDepth
            
    -- If we hit the wall initially behind the camera
    elseif ( string.contains ( sColliderTag, "Wall2" ) ) then
    
        cx = x / (1 - (objectWidth / (10 * roomWidth)))
        cz = z + 0.5 * objectDepth
        
    -- If we hit the wall initially to the right of the camera
    elseif ( string.contains ( sColliderTag, "Wall3" ) ) then

        cx = x + 0.5 * objectDepth
        cz = z / (1 - (objectWidth / (10 * roomDepth)))
                
    elseif ( string.contains ( sColliderTag, "Wall4" ) ) then
    
        cx = x - 0.5 * objectDepth
        cz = z / (1 - (objectWidth / (10 * roomDepth)))

    end
    
    local ax, ay, az = math.vectorSubtract ( cx, 0, cz, nRayPntX, 0, nRayPntZ )
    local anx, any, anz = math.vectorNormalize ( ax, ay, az )
    this.correctionAngle ( this.calculateAngleBetweenVectors ( nRayDirX, nRayDirZ, anx, anz ) )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
