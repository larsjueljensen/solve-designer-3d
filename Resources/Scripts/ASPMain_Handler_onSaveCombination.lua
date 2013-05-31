--------------------------------------------------------------------------------
--  Handler.......... : onSaveCombination
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSaveCombination (  )
--------------------------------------------------------------------------------
	
    local hUser = this.getUser ( )
    
    local hWnd = hud.getComponent ( hUser,  "DialogsHUD.Dialog_Save" )
    hud.callAction( hUser, "MoveObjectHUD.Close" )
    hud.callAction( hUser, "HUD_sidemenu.HideMenuHolder" )
    hud.setComponentVisible ( hWnd, true )
    
    this.SaveCombination(  ) 
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
