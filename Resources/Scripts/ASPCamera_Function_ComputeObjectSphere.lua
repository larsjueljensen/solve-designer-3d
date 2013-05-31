--------------------------------------------------------------------------------
--  Function......... : ComputeObjectSphere
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPCamera.ComputeObjectSphere ( hObj )
--------------------------------------------------------------------------------
	
    local b         = false
    local x, y, z   = 0, 0, 0
    local r         = 1
    local s         = application.getCurrentUserScene ( )
    
    if ( s ~= nil )
    then
        --local c     = scene.getObjectCount ( s )
       
        -- Compute center
        --
       
            local o = hObj
            if ( o ~= nil )
            then
                if ( object.isKindOf ( o, object.kTypeShape ) and (scene.getObjectTag ( s, o) ~= "Plane"))
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
      
        
        -- Compute radius
        --
       
            --local o = hObj
            
            if ( o ~= nil )
            then
                if ( object.isKindOf ( o, object.kTypeShape ) and (scene.getObjectTag ( s, o) ~= "Plane"))
                then
                    local tx, ty, tz = object.getBoundingSphereCenter ( o )
                    
                    r = math.max ( r, math.vectorLength ( x - tx, y - ty, z - tz ) + object.getBoundingSphereRadius ( o ) )
                end
            end
       
    end
    
    this.nBSphereX      ( x + 30 )
    this.nBSphereY      ( y - 30)
    this.nBSphereZ      ( z+0)
    this.nObjectBoundingSphereRadius ( r + 25 )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
