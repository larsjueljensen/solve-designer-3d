--------------------------------------------------------------------------------
--  Function......... : SetWheel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.SetWheel ( nPosX )
--------------------------------------------------------------------------------
	
	local hWheel = hud.getComponent ( this.getUser ( ), "main.Wheelbar" )
    
    hud.setComponentPosition ( hWheel ,(  nPosX  ), 50 )
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------