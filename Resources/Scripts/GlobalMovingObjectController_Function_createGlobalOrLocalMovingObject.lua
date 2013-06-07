--------------------------------------------------------------------------------
--  Function......... : createGlobalOrLocalMovingObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.createGlobalOrLocalMovingObject ( hHitObject )
--------------------------------------------------------------------------------
	
   -- Search towards the root of the scene object hierarchy to find the first wardrobe object
    local hWardrobeObject = this.getHelperObject ( hHitObject, "WardrobeObject" )
    
    -- If the wardrobe object was found
    if ( hWardrobeObject ~= nil ) then
    
        -- If there are no more objects above the wardrobe object in the hierarchy
        if this.isWardrobeObjectRoot( hWardrobeObject ) then

            -- Create a GLOBAL moving object helper
            this.createMovingObject( hWardrobeObject, "Global" )
            return "Global"

        -- If there are more objects above the wardrobe object
        else
        
            -- Get the parent of the wardrobe object
            local hWardrobeParent = object.getParent ( hWardrobeObject )

            -- If the parent turns out to be a wardrobe group (ie. hulls with attached sliding doors)
            if this.isHelperObject ( hWardrobeParent, "WardrobeGroup" ) then
            
                -- Create a GLOBAL moving object helper
                this.createMovingObject( hWardrobeParent, "Global" )
                return "Global"
            else

                -- Create a LOCAL moving object helper
                this.createMovingObject( hWardrobeObject, "Local" )
                return "Local"
            end
        end
    end	

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
