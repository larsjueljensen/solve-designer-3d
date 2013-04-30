--------------------------------------------------------------------------------
--  Function......... : computeSceneBSphere
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera2D.computeSceneBSphere ( )
--------------------------------------------------------------------------------
	
    local b         = false
    local x, y, z   = 0, 0, 0
    local r         = 1
    local s         = application.getCurrentUserScene ( )
    
    if ( s ~= nil )
    then
        local c     = scene.getObjectCount ( s )
       
        -- Compute center
        --
        for i = 0, c - 1
        do
            local o = scene.getObjectAt ( s, i )
            log.message (scene.getObjectTag ( s, o) ~= "Floor")
            if ( o ~= nil )
            then
                if ( object.isKindOf ( o, object.kTypeShape ) and (scene.getObjectTag ( s, o) ~= "Floor"))
                then
                    local tx, ty, tz = object.getBoundingSphereCenter ( o )
                    
                    if ( not b )
                    then
                        x, y, z = tx, ty, tz
                        
                        b = true
                    else
                        x, y, z = math.vectorScale ( x + tx, y + ty, z + tz, 0 )
                    end
                end
            end
        end
        
        -- Compute radius
        --
        for i = 0, c - 1
        do
            local o = scene.getObjectAt ( s, i )
            
            if ( o ~= nil )
            then
                if ( object.isKindOf ( o, object.kTypeShape ) and (scene.getObjectTag ( s, o) ~= "Floor"))
                then
                    local tx, ty, tz = object.getBoundingSphereCenter ( o )
                    
                    r = math.max ( r, math.vectorLength ( x - tx, y - ty, z - tz ) + object.getBoundingSphereRadius ( o ) )
                end
            end
        end
    end
    
    this.nBSphereX      ( x+0 )
    this.nBSphereY      ( y )
    this.nBSphereZ      ( z+0)
    this.nBSphereRadius ( r-300)
    
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
