--------------------------------------------------------------------------------
--  Handler.......... : onDeselect
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onDeselect (  )
--------------------------------------------------------------------------------
	
    this.hSelectedObject ( nil )    
    object.setVisible ( object.getParent (  this.hMovingObject( ) ) )
    this.hMovingObject ( nil ) 
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
