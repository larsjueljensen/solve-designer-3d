--------------------------------------------------------------------------------
--  Handler.......... : onDeselect
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onDeselect (  )
--------------------------------------------------------------------------------
	
	--
	-- Write your code here, using 'this' as current AI instance.
	--
    
    this.hSelectedObject ( nil )
    
    local hIcon = object.getParent (  this.hMovingObject( ) )
    
    object.setVisible ( hIcon )
    this.hMovingObject ( nil ) 
    log.message ( "onDeselect: object deselected" )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
