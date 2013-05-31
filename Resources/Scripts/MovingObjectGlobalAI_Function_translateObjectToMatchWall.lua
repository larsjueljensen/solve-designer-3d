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
    local dragObjectWidth, dragObjectHeight, dragObjectDepth = this.getDimensions( hObject )

    local sColliderTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hCollider )
    
     -- If we hit the wall initally in front
    if ( string.contains ( sColliderTag, "Wall1" ) ) then
    
            local factor = cx / ( 5 * roomWidth )
            local deltaX = 0.5 * this.objectWidth ( ) * factor                          
            
            local x, y, z
            x = cx - deltaX  
            y = 0
            z = cz + ( 0.5 * this.objectDepth ( ) )
        
            object.setTranslation ( hObject, x, y, z, object.kGlobalSpace )
    
    -- If we hit the wall initally behind
    elseif ( string.contains ( sColliderTag, "Wall2" ) ) then

            local factor = cx / ( 5 * roomWidth )
            local deltaX = 0.5 * this.objectWidth ( ) * factor                          
            
            local x, y, z
            x = cx - deltaX  
            y = 0
            z = cz - ( 0.5 * this.objectDepth ( ) )
        
            object.setTranslation ( hObject, x, y, z, object.kGlobalSpace )
    
    -- If we hit the wall initally to the right
    elseif ( string.contains ( sColliderTag, "Wall3" ) ) then

            local factor = cz / ( 5 * roomDepth )
            local deltaZ = 0.5 * this.objectWidth ( ) * factor                          
            
            local x, y, z
            x = cx - ( 0.5 * this.objectDepth ( ) )  
            y = 0
            z = cz - deltaZ
        
            object.setTranslation ( hObject, x, y, z, object.kGlobalSpace )
            
    -- If we hit the wall initally to the left    
    elseif ( string.contains ( sColliderTag, "Wall4" ) ) then

            local factor = cz / ( 5 * roomDepth )
            local deltaZ = 0.5 * this.objectWidth ( ) * factor                          
            
            local x, y, z
            x = cx + ( 0.5 * this.objectDepth( ) )  
            y = 0
            z = cz - deltaZ
        
            object.setTranslation ( hObject, x, y, z, object.kGlobalSpace )
    
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
