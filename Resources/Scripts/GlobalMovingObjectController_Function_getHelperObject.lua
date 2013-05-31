--------------------------------------------------------------------------------
--  Function......... : getHelperObject
--  Author........... : Lars Juel Jensen
--  Description...... : Traverses towards the root from an object in the scene
--                    :   and returns the first object with a model corresponding to
--                    :   the given helper name
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Param hObject..........: An object in the scene to search from
--  Param sHelperName......: The name of the model to find. Should be one of the following:
--                         :  * "WardrobeObject"
--                         :  * "WardrobeGroup"
--                         :  * "MovingObjectGlobal"
--                         :  * "MovingObjectLocal"
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.getHelperObject ( hObject, sHelperName )
--------------------------------------------------------------------------------

    -- Set the result (current object to check) to the object to search from
    local hResult = hObject
    
    -- As long as the result can be the object we want
    while ( hResult ~= nil ) do
        
        -- If the result is the helper object we are looking for
        if this.isHelperObject ( hResult, sHelperName ) then
            -- Return the result
            return hResult
        end

        -- Move one step closer to the root
        hResult = object.getParent ( hResult )
    end

    -- We did not find the object we wanted, return nil
    return nil

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
