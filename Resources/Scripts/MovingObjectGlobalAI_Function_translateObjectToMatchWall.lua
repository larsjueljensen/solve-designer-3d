--------------------------------------------------------------------------------
--  Function......... : translateObjectToMatchWall
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.translateObjectToMatchWall ( hObject, hCollider, cx, cy, cz )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local roomWidth = user.getAIVariable ( hUser, "ASPMain", "RoomWidth" )
    local roomDepth = user.getAIVariable ( hUser, "ASPMain", "RoomLength" )

    local sColliderTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hCollider )
    local x, y, z
    
     -- If we hit the wall initially in front
    if ( string.contains ( sColliderTag, "Wall1" ) ) then
    
            local factor = cx / ( 5 * roomWidth )
            local deltaX = 0.5 * this.objectWidth ( ) * factor                          
            
            x = cx - deltaX  
            y = 0
            z = cz + ( 0.5 * this.objectDepth ( ) )
 
    -- If we hit the wall initially behind
    elseif ( string.contains ( sColliderTag, "Wall2" ) ) then

            local factor = cx / ( 5 * roomWidth )
            local deltaX = 0.5 * this.objectWidth ( ) * factor                          
            
            x = cx - deltaX  
            y = 0
            z = cz - ( 0.5 * this.objectDepth ( ) )

    -- If we hit the wall initially to the right
    elseif ( string.contains ( sColliderTag, "Wall3" ) ) then

            local factor = cz / ( 5 * roomDepth )
            local deltaZ = 0.5 * this.objectWidth ( ) * factor                          
            
            x = cx - ( 0.5 * this.objectDepth ( ) )  
            y = 0
            z = cz - deltaZ
 
    -- If we hit the wall initially to the left    
    elseif ( string.contains ( sColliderTag, "Wall4" ) ) then

            local factor = cz / ( 5 * roomDepth )
            local deltaZ = 0.5 * this.objectWidth ( ) * factor                          
            
            x = cx + ( 0.5 * this.objectDepth( ) )  
            y = 0
            z = cz - deltaZ
    end
	
    object.setTranslation ( hObject, x, y, z, object.kGlobalSpace )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
