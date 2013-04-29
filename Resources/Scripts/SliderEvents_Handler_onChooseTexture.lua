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

    log.message ( "In fnc SliderEvents.onChooseTexture: ", sTextureName )

     
    --user.sendEvent ( this.getUser ( ), "MovingObject", "onTapAction", 100, 2 )
    this.sSlider ( sSliderName )
    
    if sTextureName == nil then  --Ok Button pressed.
    
    sTextureName = this.sTexture ( )
    
    else
    this.sTexture ( sTextureName )
    --show editor dialogue
    end
    --Get variables.
    log.message ( "In Sliderevents onChoosetexture, received: ", sSliderName )
    
    local hObject = user.getAIVariable ( hUser, "MovingObject", "hSelectedObject" )
    local nAttributeID = user.getAIVariable ( hUser, "aspmenu_AI", "nSliderMode" )
    local hSliderObject = scene.getTaggedObject ( application.getCurrentUserScene ( ), sSliderName )

    log.message ( "Got variable Attribute for texture handling: ", nAttributeID )
    log.message ( "Got variable hSliderObject for texture handling: ", hSliderObject )
    log.message ( "Got variable hObject for texture handling: ", hObject )


    if hObject then
    local hParent = object.getParent ( hObject )
    
        if hParent then
        
        log.message ( "Got parent = ", hParent )
        
        local hChild = object.getChildAt ( hParent, 0 )
        
        log.message ( "Got selected object: ", hObject  )
        log.message ( "Child object of room null = ", hChild )

        --object.sendEvent ( hSliderObject, "SliderTarget", "onChangeTexture", sTextureName  )
        
        
        
        --shape.overrideMeshSubsetMaterialEffectMap0 ( hObject, 1, sTextureName, shape.kMapTypeTexture )
        --object.sendEvent ( hSliderObject, "Slider", "onApplyTexture", sSliderName, sTextureName  )
             
            if hSliderObject then 
                --copy value to register for runtime use.
                
                
                
                --forward the event to the slider
                
                
                
                    object.sendEvent ( hSliderObject, "Slider", "onChooseTexture", sSliderName, sTextureName )
            end           
        end
    
    else
    --do stuff
    end
    
    this.ShowDialogWnd (  )
    hud.setComponentBackgroundImage ( hud.getComponent ( hUser, "HUD_sidemenu.SelectionThumb" ), this.sTexture( ) )
    this.sTexture ( sTextureName )

    
    
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
