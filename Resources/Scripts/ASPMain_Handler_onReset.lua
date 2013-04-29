--------------------------------------------------------------------------------
--  Handler.......... : onReset
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onReset (  )
--------------------------------------------------------------------------------
	
	object.sendEvent ( application.getCurrentUserActiveCamera ( ), "ASPCamera", "onReset" )
    
    this.bTopViewMode ( false )

    --object.sendEvent ( application.getCurrentUserActiveCamera ( ), "ASPCamera", "onTopView" )
    
    --object.sendEvent ( application.getCurrentUserActiveCamera ( ), "ASPCamera", "onSetCamera" )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
