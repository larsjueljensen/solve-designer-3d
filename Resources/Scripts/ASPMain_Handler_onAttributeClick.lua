--------------------------------------------------------------------------------
--  Handler.......... : onAttributeClick
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onAttributeClick (  )
--------------------------------------------------------------------------------
	
    local hButton = hud.getUnderCursorComponent ( this.getUser ( ) )
    
    if hButton ~= nil then 
    this.ClearButtonRow ( )
    hud.setComponentBackgroundImage ( hButton, "Btn_glass_on" )
    end
    

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
