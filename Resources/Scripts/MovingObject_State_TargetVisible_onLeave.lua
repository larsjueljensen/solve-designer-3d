--------------------------------------------------------------------------------
--  State............ : TargetVisible
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.TargetVisible_onLeave ( )
--------------------------------------------------------------------------------
	
    
    --object.setVisible ( scene.getTaggedObject ( application.getCurrentUserScene( ), "target" ) , false )
    
    hud.setComponentVisible ( hud.getComponent ( this.getUser ( ), "main.CursorThumb" ), false )


	log.message ( "Leaving Visibility loop" )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
