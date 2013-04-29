--------------------------------------------------------------------------------
--  Function......... : AddToGroup
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.AddToGroup ( hObject, hParent )
--------------------------------------------------------------------------------
	
--     local hObject = this.hMovingObject ( )
     --local hParent = this.hParentObject ( )
--     
    log.message ( "In AddToGroup, Object: ", hObject )
    log.message ( "In AddToGroup, Parent: ", hParent )
	object.setParent ( hObject, hParent, true )
    
   
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
