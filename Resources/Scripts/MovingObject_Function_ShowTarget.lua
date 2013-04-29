--------------------------------------------------------------------------------
--  Function......... : ShowTarget
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.ShowTarget ( )
--------------------------------------------------------------------------------
	
 
    local hUser = application.getCurrentUser ( )
    
    this.TargetIsVisible ( true )
    
    
    --hud.newComponent ( hUser, hud.kComponentTypeLabel, "main.CursorThumb" )
    
    local hTargetThumb = hud.getUnderCursorComponent ( this.getUser ( )  )
    
    
    local hCursor = hud.getComponent ( hUser, "main.CursorThumb") 
    local sName = hud.getComponentBackgroundImageName ( hTargetThumb )
    
    --local sButtonImage = hud.getComponentBackgroundImageName ( ) )
    hud.setComponentBackgroundImage ( hCursor, sName )
    this.TargetVisible ( )
 
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
