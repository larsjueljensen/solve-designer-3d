--------------------------------------------------------------------------------
--  Function......... : rotateObjectToMatchWall
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.rotateObjectToMatchWall ( hObject, hCollider )
--------------------------------------------------------------------------------
	
    local sColliderTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hCollider )

    -- If we hit the wall initially in front
    if ( string.contains ( sColliderTag, "Wall1" ) ) then
    
        object.setRotation ( hObject, 0, 0, 0 , object.kGlobalSpace )

    -- If we hit the wall initially behind
    elseif ( string.contains ( sColliderTag, "Wall2" ) ) then

        object.setRotation ( hObject, 0, 180, 0 , object.kGlobalSpace )

    -- If we hit the wall initially to the right
    elseif ( string.contains ( sColliderTag, "Wall3" ) ) then

        object.setRotation ( hObject, 0, 270, 0 , object.kGlobalSpace )
        
    -- If we hit the wall initially to the left    
    elseif ( string.contains ( sColliderTag, "Wall4" ) ) then

        object.setRotation ( hObject, 0, 90, 0 , object.kGlobalSpace )

    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
