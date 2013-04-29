--------------------------------------------------------------------------------
--  Handler.......... : onShowObjectInfo
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderEvents.onShowObjectInfo (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    
    --Get button
    --
    local hInfoButton = hud.getUnderCursorComponent ( hUser )
    
    log.message ( "Info click: ", hInfoButton )
    
    --GetPosition
    --
    local nBtnX, nBtnY = hud.getComponentScreenSpaceCenter( hInfoButton  )
        
    log.message ( "Button pos: ", nBtnX, "  " , nBtnY )
    
	local hThumbnail = hud.getComponentAtPoint ( hUser, nBtnX + 4 , nBtnY -5  )
    
    log.message ( "Thumbnail value: ", hThumbnail )
    
    local sSelection = hud.getComponentBackgroundImageName ( hThumbnail )
    log.message ( "Show info for: ", sSelection  )
    
    local hWindow = hud.getComponent ( hUser, "main.InfoWindow" )
    
    --Get object text strings by sending request to Solve using GET
    --
    
    --Set window text values.
    --
    local hHeader = hud.getComponent( hUser, "main.InfoHeader")
    local hTextHolder_0 = hud.getComponent ( hUser, "main.InfoText_0" )
    local hTextHolder_1 = hud.getComponent ( hUser, "main.InfoText_1" )
    
    hud.setLabelText ( hTextHolder_0, " ........innhold fra Solve" )
    hud.setLabelText ( hTextHolder_1, " ........mer innhold fra Solve" )
    hud.setLabelText ( hHeader, "Varenr:"..sSelection )
    
    --Set window thumbnail
    --
    hud.setComponentBackgroundImage( hud.getComponent( hUser, "main.InfoImage"), sSelection )
    
    --Show window
    --
    hud.setComponentVisible ( hWindow, true )
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
