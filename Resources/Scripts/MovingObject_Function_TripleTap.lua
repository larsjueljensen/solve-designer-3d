--------------------------------------------------------------------------------
--  Function......... : TripleTap
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.TripleTap ( )
--------------------------------------------------------------------------------

    local hUser = application.getCurrentUser ( )
    local hCursorTools = hud.getComponent ( hUser, "CursorHUD_1.ToolBox" )
    local bIsVisible = hud.isComponentVisible ( hCursorTools )
    if hCursorTools then

    
            if bIsVisible 
            then
            hud.setComponentVisible ( hCursorTools, false )

            this.Idle ( )
            else

            hud.setComponentVisible ( hCursorTools, true )
            end
	
    else
    end
    
    this.ShowTools ( )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
