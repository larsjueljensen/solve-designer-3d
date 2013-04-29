--------------------------------------------------------------------------------
--  State............ : TargetVisible
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.TargetVisible_onEnter ( )
--------------------------------------------------------------------------------
    if this.TargetIsVisible ( ) == true then
    

    local hObject = scene.getTaggedObject ( application.getCurrentUserScene( ), "target" )
    
    
    
    --object.setVisible (  hObject, true ) 
    
    hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "main.CursorThumb" ), true )
    
    else
    
    
    end

	
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
