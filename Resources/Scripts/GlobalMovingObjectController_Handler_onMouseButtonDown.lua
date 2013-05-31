--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonDown
--  Author........... : Lars Juel Jensen
--  Description...... : Creates a global or local moving object helper
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.onMouseButtonDown ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
    -- If the left mouse button was pressed
    if ( nButton == this.kLeftButton ( ) ) then
    
        -- Get the first object with a sensor that is found using ray casting (ie. first sensor hit with mouse cursor)
        local hHitObject, nHitDist, nHitSensorID = scene.getFirstHitSensor ( application.getCurrentUserScene ( ), nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 1000 )
        
        -- If that object exists and has a sensor that defines the object as movable
        if this.isHitObjectMovable( hHitObject ) then
            
            -- Search towards the root of the scene object hierarchy to find the first wardrobe object
            local hWardrobeObject = this.getHelperObject ( hHitObject, "WardrobeObject" )
            
            -- If the wardrobe object was found
            if ( hWardrobeObject ~= nil ) then
            
                -- If there are no more objects above the wardrobe object in the hierarchy
                if this.isWardrobeObjectRoot( hWardrobeObject ) then

                    -- Create a GLOBAL moving object helper
                    this.createMovingObject( hWardrobeObject, "Global" )

                -- If there are more objects above the wardrobe object
                else
                
                    -- Get the parent of the wardrobe object
                    local hWardrobeParent = object.getParent ( hWardrobeObject )

                    -- If the parent turns out to be a wardrobe group (ie. hulls with attached sliding doors)
                    if this.isHelperObject ( hWardrobeParent, "WardrobeGroup" ) then
                    
                        -- Create a GLOBAL moving object helper
                        this.createMovingObject( hWardrobeParent, "Global" )
                    else

                        -- Create a LOCAL moving object helper
                        this.createMovingObject( hWardrobeObject, "Local" )
                    end
                end
            end
        end
        
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
