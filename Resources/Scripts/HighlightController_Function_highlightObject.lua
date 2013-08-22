--------------------------------------------------------------------------------
--  Function......... : highlightObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.highlightObject ( hObject, bTurnOn )
--------------------------------------------------------------------------------

    
    if (hObject ~= nil) then

        local hHighlightableObject = hObject
        
        if (this.isMovingObject ( hHighlightableObject )) then
            hHighlightableObject = object.getChildAt ( hObject, 0 )
        end

        if ( hHighlightableObject ~= nil ) then
            object.sendEvent ( hHighlightableObject, "HighlightObjectAI", "onHighlight", bTurnOn )
        end
        
        if ( bTurnOn ) then
            this.hHighlightedObject ( hHighlightableObject )
        else
            this.hHighlightedObject ( nil )
        end
        

    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
