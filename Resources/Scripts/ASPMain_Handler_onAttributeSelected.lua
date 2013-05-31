--------------------------------------------------------------------------------
--  Handler.......... : onAttributeSelected
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onAttributeSelected ( nAttribID )
--------------------------------------------------------------------------------
   
    local hUser = this.getUser()
    this.BuildState( nAttribID )
    this.nSliderMode ( nAttribID ) 

    local hSlider = scene.getTaggedObject ( application.getCurrentUserScene( ), "Slider" )
    local hButton = hud.getUnderCursorComponent ( hUser )
    
    if nAttribID >= 0 and nAttribID <= 13 then
        this.nSliderMode ( nAttribID )
    end
    
    if nAttribID == nil then
        object.sendEventImmediate ( hSlider, "Slider", "onDestroyThumbnail" )
    end

    object.sendEventImmediate ( hSlider, "Slider", "onDestroyThumbnail" )

    if nAttribID == 14 then
        this.ClearButtonRow( )
    else
        this.SetSliderThumbs ( )
        
        if nAttribID > 5 then
            this.ClearButtonRow (  )
        end    
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
