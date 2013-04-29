--------------------------------------------------------------------------------
--  Handler.......... : onGetPrice
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onGetPrice (  )
--------------------------------------------------------------------------------
	
	--hud.callAction ( this.getUser ( ), "controls.PriceClicked" )
    
    local hUser = application.getCurrentUser ( )
    
    local hWnd = hud.getComponent ( hUser, "DialogsHUD.Dialog_Report" )
        hud.callAction( hUser, "HUD_sidemenu.HideMenuHolder" )
    
    local bState = this.bDialogReport ( )
    local hList = hud.getComponent( hUser, "DialogsHUD.SceneObjects")
    
    if bState == false
    then
    hud.enableListFingerScrolling ( hList, true )
        hud.setComponentVisible ( hWnd, true )
    
        this.bDialogReport( true )
        this.GetContent ( )
    else
        hud.enableListFingerScrolling ( hList, true )
        this.bDialogReport( false )
        hud.setComponentVisible ( hWnd, false )
        this.CloseReport ( )
    end

    
    
    --Get Objects in scene.
    
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
