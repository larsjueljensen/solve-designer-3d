--------------------------------------------------------------------------------
--  Handler.......... : onAttributeSelected
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onAttributeSelected ( nAttribID )
--------------------------------------------------------------------------------
	
	    --local nButton = hud.getUnderCursorComponent ( this.getUser ( ) )    local hUser = application.getCurrentUser( )
    log.message ( "In ASPMain onAttributeSelected" )
    log.message ( "received: ",  nAttribID )
    
    local hUser = this.getUser()
    this.BuildState( nAttribID )

    
    local nMode = nAttribID
    this.nSliderMode ( nAttribID ) 

--destroy thumbnails.
--user.sendEventImmediate ( this.getUser ( ), "Slider", "onDestroyThumbnails")
--get objecthandle.

local hSlider = scene.getTaggedObject ( application.getCurrentUserScene( ), "Slider" )
log.message ( "Got Slider: ", hSlider )

    local hButton = hud.getUnderCursorComponent ( hUser )
    
    
    --Set texture cat buttons
    
    if nAttribID == 0 then
    
    this.nSliderMode ( 0 )
    
    elseif nAttribID == 1 then
    
    this.nSliderMode ( 1 )

    elseif nAttribID == 2 then

    this.nSliderMode ( 2 )
    
    elseif nAttribID == 3 then

    this.nSliderMode ( 3 )

    elseif nAttribID == 4 then

    this.nSliderMode ( 4 )

    elseif nAttribID == 5 then

    this.nSliderMode ( 5 )

    elseif nAttribID == 6 then

    this.nSliderMode ( 6 )


    elseif nAttribID == 7 then

    this.nSliderMode ( 7 )


    elseif nAttribID == 8 then

    this.nSliderMode ( 8 )


    elseif nAttribID == 9 then
    --Clean up slider palette
    this.nSliderMode ( 9 )


    elseif nAttribID == 10 then

    this.nSliderMode ( 10 )
    
    elseif nAttribID == 11 then

    this.nSliderMode ( 11)
    
    elseif nAttribID == 12 then

    this.nSliderMode ( 12 )
    
    elseif nAttribID == 13 then
 
    this.nSliderMode ( 13 )

    end
    
    if nAttribID ~= nil then
    
    else
        object.sendEventImmediate ( hSlider, "Slider", "onDestroyThumbnail" )

    end
    object.sendEventImmediate ( hSlider, "Slider", "onDestroyThumbnail" )

    
    
    
   --user.sendEvent ( application.getCurrentUser ( ), "aspmenu_AI", "onAttributeSelected", nAttribID )
    if nAttribID == 14 then
    
    this.ClearButtonRow( )
    
    else
    this.SetSliderThumbs ( )
        if nAttribID > 5 then
        
        --hud.setComponentVisible ( hud.getComponent( this.getUser ( ), "main.ButtonRow"), false )
        this.ClearButtonRow (  )
        
        end    
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------