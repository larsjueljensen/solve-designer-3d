--------------------------------------------------------------------------------
--  Handler.......... : onHighlightObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onHighlightObject ( hHitObject, hObject )
--------------------------------------------------------------------------------

    if hObject ~= nil then
         
        if this.hHighlightedObject ( ) ~= nil then
            if object.isEqualTo ( hObject, this.hHighlightedObject ( ) ) == false then
                this.HighlightSelectedObject ( hHitObject, this.hHighlightedObject ( ), 1 )
                this.hHighlightedObject ( hObject )
                this.HighlightSelectedObject ( hHitObject, hObject, 0 )
            end
        end    
    end    
        

    if hHitObject ~= nil then
        local bSensorType = sensor.getCategoryBitAt ( hHitObject, 0 , 4 )
        local bSensorTypeAddon = sensor.getCategoryBitAt ( hHitObject, 0 , 5 )

        if bSensorType then

            if bSensorTypeAddon then
                local hObject = object.getParent ( hHitObject )
                this.HighlightSelectedObject ( hHitObject, hObject, 0 )
                this.hHighlightedObject ( hObject )
            end

        else
        
            if this.hHighlightedObject ( ) ~= nil then
                this.HighlightSelectedObject ( hHitObject, this.hHighlightedObject ( ), 1 )
            end
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
