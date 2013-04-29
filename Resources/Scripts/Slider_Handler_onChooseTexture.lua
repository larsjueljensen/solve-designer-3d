--------------------------------------------------------------------------------
--  Handler.......... : onChooseTexture
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.onChooseTexture ( sSlidername, sTextureName )
--------------------------------------------------------------------------------

    local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    local hReflections = scene.getTaggedObject( hScene, "RefGround"  ) 

    local nState
	
    log.message ( "In fnc Slider.onChooseTexture: ", sTextureName )
    
    
    local sTarget = user.getAIVariable ( hUser, "MovingObject", "hSelectedObject" )
    
    log.message( "Gor hSelectedObject: ", sTarget )
    local sTag = scene.getObjectTag ( hScene, sTarget )
   
    
    local sWall_1 = "Wall2"
    local sWall_2 = "Wall3"
    local nWall_1 = string.compare ( sTag, sWall_1 )
    local nWall_2 = string.compare( sTag, sWall_2 )
    if nWall_1 == 0 then
    this.nWallNumber ( 0 )
    elseif nWall_2 == 0 then
    this.nWallNumber ( 1 )
    end
    
    local hButton = hud.getUnderCursorComponent( hUser )
    
    if hButton then
    local hContainer = hud.getComponentContainer ( hButton )
    local sName = hud.getComponentTag ( hContainer )
    local bIsPalette = string.compare ( sName, "Palette" )
    
        if bIsPalette == true then
        log.message ( "Button is static palette" )
        end
    end

    shape.overrideMeshSubsetMaterialDiffuse ( sTarget, 1, 0.6, 0.6, 0.6, 1 )

    
    

     
    log.message ( sTarget )
    log.message ( nWall_1 )
    log.message ( nWall_2 )
    
    
    this.sTargetObject ( sTarget )
    
    this.nSliderMode ( user.getAIVariable ( hUser, "aspmenu_AI", "nSliderMode" )) 
    --forward the choice to the Slider AI handle by the target object
    if ( sTarget   )
    then    
        if ( sTarget ) then 
        log.message ( "Got target object: ", sTarget )

            
            
        if bIsPalette == true then
        
        else
            
                if  this.nSliderMode( ) == 7 then 
                
                    shape.setMeshMaterial ( sTarget, "ASP_Wallpaper_"..this.nWallNumber( ) )
                    object.sendEvent ( sTarget, "SliderTarget", "onChangeTexture", sTextureName, this.nSliderMode( )  )

                elseif this.nSliderMode( ) == 8 then
                    
                        shape.setMeshMaterial ( sTarget, "ASP_Walltiles_"..this.nWallNumber( ) )
                        object.sendEvent ( sTarget, "SliderTarget", "onChangeTexture", sTextureName, this.nSliderMode( )  )
                        
                elseif this.nSliderMode( ) == 9 then
                        shape.setMeshMaterial ( sTarget, "ASPWALL_Brick_"..this.nWallNumber( ) )
                        object.sendEvent ( sTarget, "SliderTarget", "onChangeTexture", sTextureName, this.nSliderMode( )  )
                elseif this.nSliderMode( ) == 10 then
                        shape.setMeshMaterial ( sTarget, "Asp_Floor_1" )
                        --enable reflections. Set value
                        object.setVisible ( hReflections, true )
                        object.sendEvent ( sTarget, "SliderTarget", "onChangeTexture", sTextureName , this.nSliderMode( ) )
                        --object.sendEvent ( scene.getTaggedObject ( hScene, "User_Room" ), "ASPRoom_AI", "onSetUV", this.nSliderMode ( )  )
                    
                    elseif this.nSliderMode( ) == 11 then
                        shape.setMeshMaterial ( sTarget, "ASP_Floortiles_0" )
                        --enable reflections. Set value
                        object.setVisible ( hReflections, true )
                        --user.sendEvent ( hUser, "ASPRoom_AI", "onSetUV",  this.nSliderMode( ) )
                        object.sendEvent ( sTarget, "SliderTarget", "onChangeTexture", sTextureName, this.nSliderMode( )  )
                    elseif this.nSliderMode ( ) == 12 then
                    
                        shape.setMeshMaterial ( sTarget, "ASP_Carpet_1" )
                        --Disable reflections, Set slider = 0                        
                        object.setVisible ( hReflections, false )                        
                        object.sendEvent ( sTarget, "SliderTarget", "onChangeTexture", sTextureName, this.nSliderMode( )  )
                    elseif this.nSliderMode( ) == 13 then
                    
                        shape.setMeshMaterial ( sTarget, "ASP_Wall_"..this.nWallNumber( ) )
             

                    else
                        object.sendEvent ( sTarget, "SliderTarget", "onChangeTexture", sTextureName, this.nSliderMode( )  )
                    
                    end
                --Updatre GUI
                
                
                user.sendEvent ( hUser, "ASPRoom_AI", "onSetUV",  this.nSliderMode( ) )

                end
        end    
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
