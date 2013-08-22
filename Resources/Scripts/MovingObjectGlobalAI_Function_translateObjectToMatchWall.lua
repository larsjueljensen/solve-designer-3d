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
    local x, y, z = cx + this.tx ( ), cy + this.ty ( ), cz + this.tz ( )
    
    y = 0
    this.setObjectTranslation( hObject, x, y, z, object.kGlobalSpace )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
