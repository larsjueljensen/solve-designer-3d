--------------------------------------------------------------------------------
--  Function......... : rotateObjectToMatchWall
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.rotateObjectToMatchWall ( hObject, hCollider )
--------------------------------------------------------------------------------
	
    local sColliderTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hCollider )
    local x, y, z = object.getRotation ( hObject, object.kGlobalSpace )

    -- If we hit the wall initially in front
    if ( string.contains ( sColliderTag, "Wall1" ) ) then
    
        -- If we are coming from Wall4
        if ( y == 90 ) then
            this.tx ( 0.5 * this.objectWidth ( ) )
            this.ty ( 0 )
            this.tz ( 0.5 * this.objectDepth ( ) )

        -- If we are coming from Wall3
        elseif ( y == -90 ) then
            this.tx ( - 0.5 * this.objectWidth ( ) )
            this.ty ( 0 )
            this.tz ( 0.5 * this.objectDepth ( ) )
        end

        object.setRotation ( hObject, 0, 0, 0 , object.kGlobalSpace )

    -- If we hit the wall initially behind
    elseif ( string.contains ( sColliderTag, "Wall2" ) ) then

        -- If we are coming from Wall4
        if ( y == 90 ) then
            this.tx ( 0.5 * this.objectWidth ( ) )
            this.ty ( 0 )
            this.tz ( - 0.5 * this.objectDepth ( ) )

        -- If we are coming from Wall3
        elseif ( y == -90 ) then
            this.tx ( - 0.5 * this.objectWidth ( ) )
            this.ty ( 0 )
            this.tz ( - 0.5 * this.objectDepth ( ) )
        end

        object.setRotation ( hObject, 0, 180, 0 , object.kGlobalSpace )

    -- If we hit the wall initially to the right
    elseif ( string.contains ( sColliderTag, "Wall3" ) ) then

        -- If we are coming from Wall1
        if ( y == 0 ) then
            this.tx ( - 0.5 * this.objectDepth ( ) )
            this.ty ( 0 )
            this.tz ( 0.5 * this.objectWidth ( ) )

        -- If we are coming from Wall2
        elseif ( y == 180 or y == -180 ) then
            this.tx ( - 0.5 * this.objectDepth ( ) )
            this.ty ( 0 )
            this.tz ( - 0.5 * this.objectWidth ( ) )
        end

        object.setRotation ( hObject, 0, -90, 0 , object.kGlobalSpace )
        
    -- If we hit the wall initially to the left    
    elseif ( string.contains ( sColliderTag, "Wall4" ) ) then
    
        -- If we are coming from Wall1
        if ( y == 0 ) then
            this.tx ( 0.5 * this.objectDepth ( ) )
            this.ty ( 0 )
            this.tz ( 0.5 * this.objectWidth ( ) )

        -- If we are coming from Wall2
        elseif ( y == 180 or y == -180 ) then
            this.tx ( 0.5 * this.objectDepth ( ) )
            this.ty ( 0 )
            this.tz ( - 0.5 * this.objectWidth ( ) )
        end

        object.setRotation ( hObject, 0, 90, 0 , object.kGlobalSpace )

    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
