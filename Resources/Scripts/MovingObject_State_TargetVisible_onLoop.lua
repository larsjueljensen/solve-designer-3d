--------------------------------------------------------------------------------
--  State............ : TargetVisible
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.TargetVisible_onLoop ( )
--------------------------------------------------------------------------------
    
    
    
    if this.TargetIsVisible ( ) == true then
    
    local hTarget = scene.getTaggedObject ( application.getCurrentUserScene( ), "target" )
    local hCursorThumb = hud.getComponent ( this.getUser ( ), "main.CursorThumb" )    
    local nX, nY = hud.getCursorPosition ( this.getUser() )
    hud.setComponentPosition (  hCursorThumb, nX, nY )
    else
    end
    
    
    
    
    
    
    
    
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
