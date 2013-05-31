--------------------------------------------------------------------------------
--  Handler.......... : onChooseTexture
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onChooseTexture ( sSliderName, sTextureName )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local hCheck_1 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_3" )
    local hCheck_2 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_4" )
    local hCheck_3 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_5" )
    local hCheck_4 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_6" )

    this.sSlider ( sSliderName )
    
    if sTextureName == nil then  --Ok Button pressed.
        sTextureName = this.sTexture ( )
    else
        this.sTexture ( sTextureName )
    end
    
    local hObject = user.getAIVariable ( hUser, "MovingObject", "hSelectedObject" )
    local nAttributeID = user.getAIVariable ( hUser, "aspmenu_AI", "nSliderMode" )
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), sSliderName )

    if hObject then
        local hParent = object.getParent ( hObject )
    
        if hParent then
        
            local hChild = object.getChildAt ( hParent, 0 )
            
            if hSliderObject then 
                object.sendEvent ( hSliderObject, "Slider", "onChooseTexture", sSliderName, sTextureName )
            end           
        end
    end
    
    this.ShowDialogWnd (  )
    hud.setComponentBackgroundImage ( hud.getComponent ( hUser, "HUD_sidemenu.SelectionThumb" ), this.sTexture( ) )
    this.sTexture ( sTextureName )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
