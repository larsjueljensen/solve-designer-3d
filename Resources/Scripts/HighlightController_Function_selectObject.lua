--------------------------------------------------------------------------------
--  Function......... : selectObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightController.selectObject ( hObject )
--------------------------------------------------------------------------------

    local sPrevTag = this.selectedObjectTag ( )
    
    if ( this.isMovingObject ( hObject ) ) then
        hObject = object.getChildAt ( hObject, 0 )
    end

    if ( hObject ~= nil ) then
        this.selectedObjectTag ( scene.getObjectTag ( application.getCurrentUserScene ( ), hObject ) )                
    else        
        this.selectedObjectTag ( "NO OBJECT SELECTED" )
        log.message ( this.selectedObjectTag ( ) )
    end
    
    if (sPrevTag ~= nil) then
        local hTaggedObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), sPrevTag )
        if ( hTaggedObject ~= nil ) then
            object.sendEvent ( hTaggedObject, "HighlightObjectAI", "onHighlight", false )
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
