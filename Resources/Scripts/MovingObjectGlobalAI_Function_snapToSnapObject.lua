--------------------------------------------------------------------------------
--  Function......... : snapToSnapObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.snapToSnapObject ( hObject, hSnapToObject, x, y, z, space )
--------------------------------------------------------------------------------

    
    -- If the snap object and the moving object is facing the same way
    if ( this.objectDirectionIsEqual ( hObject, hSnapToObject ) ) then
                    
        -- Calculate vector and distance between snap object and wanted position
        local dx, dy, dz, length = this.calculateVectorAndDistanceToObject ( x, y, z, hSnapToObject, space )
        
        -- Get the snap object's width
        local otherWidth = object.getAIVariable ( hSnapToObject, "CommonObjectProperties", "objectWidth" )
        
        -- Calculate the distance between the objects when they are snapped together
        local distanceBetweenHullCenters = 0.5 * (this.objectWidth ( ) + otherWidth)
        
        if (length <= 0.5) then
            
            this.swapObjectsPosition ( hObject, hSnapToObject, space )
            dx, dy, dz, length = this.calculateVectorAndDistanceToObject ( x, y, z, hSnapToObject, space )

        end
                
        -- If we are within snap range
        if (length <= distanceBetweenHullCenters + 1) then

            -- Get snap object's position
            local sx, sy, sz = object.getTranslation ( hSnapToObject, space )
            dx, dy, dz = this.calculateVectorFromSnapObjectToSnapPosition ( dx, dy, dz, distanceBetweenHullCenters )
            return sx + dx, sy + dy, sz + dz
        
        end
        
    end

    return x, y, z
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
