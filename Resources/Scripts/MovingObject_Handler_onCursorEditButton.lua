--------------------------------------------------------------------------------
--  Handler.......... : onCursorEditButton
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onCursorEditButton ( n )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser( )
    
    log.message ( "onCursorEdit: ", n )
    
    if n == 1 then
    
    
    this.HighLightDialogElement ( n )
    
    else
    
    --turn off highlight and close menu
    this.HighLightDialogElement ( n )
        
    end
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
