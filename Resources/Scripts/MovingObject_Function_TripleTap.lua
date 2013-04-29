--------------------------------------------------------------------------------
--  Function......... : TripleTap
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.TripleTap ( )
--------------------------------------------------------------------------------
	
	--
	-- Write your code here, using 'this' as current AI instance.
	--
    log.message ( "3 taps detected"  )
    local hUser = application.getCurrentUser ( )
    local hCursorTools = hud.getComponent ( hUser, "CursorHUD_1.ToolBox" )
    local bIsVisible = hud.isComponentVisible ( hCursorTools )
    if hCursorTools then

    
    
            if bIsVisible 
            then
            hud.setComponentVisible ( hCursorTools, false )
            log.message ("Hide ToolBox"  )
            this.Idle ( )
            else
            log.message ("Show ToolBox"  )
            hud.setComponentVisible ( hCursorTools, true )
            end
	
    else
    end
    
    this.ShowTools ( )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
