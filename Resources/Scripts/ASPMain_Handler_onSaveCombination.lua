--------------------------------------------------------------------------------
--  Handler.......... : onSaveCombination
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSaveCombination (  )
--------------------------------------------------------------------------------
	
    	--Get saveobject
    local hUser = this.getUser ( )
    
    local hObject = user.getAIVariable ( this.getUser ( ), "MovingObject", "hSelectedObject")
    
    if hObject then
    local sObjectTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hObject )
     log.message ( "sObjectTag = ", sObjectTag )
    end
    if hObject == nil then
    log.message ( "Velg hva som skal lagres." )
    else
        if sObjectTag == "Group_" then
            log.message ( "function ASPMain.onSaveCombination (  ), Got var = ", hObject )
        else
            log.message ( "Ugyldig valg!" )
            
            local hParent = object.getParent ( hObject )
            
            log.message ( "Fetching parent!: ", hParent )
            
            hObject = hParent
        end
    end
    
    local hWnd = hud.getComponent ( hUser,  "DialogsHUD.Dialog_Save" )
    hud.callAction( hUser, "MoveObjectHUD.Close" )
    hud.callAction( hUser, "HUD_sidemenu.HideMenuHolder" )
    hud.setComponentVisible ( hWnd, true )
    --hud.callAction( hUser, "controls.HideMenuBar" )
    
    
    this.SaveCombination(  ) 

    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
