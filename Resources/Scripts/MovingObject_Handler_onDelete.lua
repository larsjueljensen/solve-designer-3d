--------------------------------------------------------------------------------
--  Handler.......... : onDelete
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onDelete (  )
--------------------------------------------------------------------------------
	
	--
	-- Write your code here, using 'this' as current AI instance.
	--
    log.message ( "onDelete: ", this.hLastObject ( ) )
    this.DestroyObject ( this.hLastObject ( ) )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------