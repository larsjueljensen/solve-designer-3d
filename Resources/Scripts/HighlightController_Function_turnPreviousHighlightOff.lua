--------------------------------------------------------------------------------
--  Function......... : turnPreviousHighlightOff
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.turnPreviousHighlightOff ( )
--------------------------------------------------------------------------------

    local hObject = this.hHighlightedObject ( )

    if ( hObject ~= nil ) then
        
        local sTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hObject )
        if ( this.selectedObjectTag ( ) ~= nil ) then
            if ( string.compare ( sTag, this.selectedObjectTag ( ) ) ~= 0 ) then
                this.highlightObject ( hObject, false )
            end
        end
        
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
