--------------------------------------------------------------------------------
--  Function......... : ClearButtonRow
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.ClearButtonRow ( )
--------------------------------------------------------------------------------
	
	
    local hParent = hud.getComponent ( this.getUser ( ), "main.Buttons_1" )
    local nChildren  = hud.getContainerChildCount ( hParent )
    
    for i = 0, nChildren - 1 do
    
    local hButton = hud.getContainerChildAt ( hParent, i )
    hud.setCheckState ( hButton, false )
    --hud.setComponentBackgroundImage ( hButton, "Btn_glass_off" )
    
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
