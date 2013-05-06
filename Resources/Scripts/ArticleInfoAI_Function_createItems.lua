--------------------------------------------------------------------------------
--  Function......... : createItems
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.createItems ( )
--------------------------------------------------------------------------------
	log.message ( "Create article info items" )
    
    local hUser = this.getUser ( )
	local hHolder = hud.getComponent( hUser, "main.ArticleInfo")
    
    local nLine = 7
    local nPosY = 85
    --create line
    
    for i = 0, nLine -1 do
    
        local hLabel = hud.newComponent( hUser, hud.kComponentTypeLabel, "main.label_"..i)
        local hData = hud.newComponent( hUser, hud.kComponentTypeLabel, "main.data_"..i )

        hud.setComponentPosition( hLabel, 10, nPosY )
        hud.setComponentPosition( hData, 53, nPosY )
        
        hud.setComponentSize ( hLabel, 40, 7 )
        hud.setComponentSize ( hData,40, 7 )

        hud.setComponentContainer( hLabel, hHolder ) 
        hud.setComponentContainer( hData, hHolder )
        
        hud.setComponentOrigin ( hLabel, hud.kOriginLeft )
        hud.setComponentOrigin ( hData, hud.kOriginLeft )
        

        hud.setComponentZOrder ( hLabel, 130 )
        hud.setComponentZOrder ( hData, 130 )
        
        hud.setComponentBackgroundColor ( hLabel, 127, 127, 127, 0 )
        hud.setComponentBackgroundColor ( hData, 0, 127, 0, 0 )
        
        hud.setComponentForegroundColor ( hLabel, 0, 0, 0, 255 )
        hud.setComponentForegroundColor ( hData, 0, 0, 0, 255 )
        
        hud.setComponentBorderColor ( hLabel, 0, 0, 0, 0 )
        hud.setComponentBorderColor ( hData, 0, 0, 0, 0 )
       
        hud.setLabelFont (hLabel, "DefaultFont" )
        hud.setLabelFont (hData, "DefaultFont" )
        hud.setButtonTextEncoding ( hLabel, hud.kEncodingUTF8 )
        hud.setButtonTextEncoding ( hData, hud.kEncodingUTF8 )
        hud.setLabelTextHeight ( hLabel, 60 )
        hud.setLabelTextHeight ( hData, 60 )
        
       
        nPosY = nPosY - 8
    
    end
    
    local hHeader2 = hud.newComponent ( hUser, hud.kComponentTypeLabel, "Header_2" )
   
    hud.setComponentContainer( hHeader2, hHolder )
    hud.setComponentForegroundColor ( hHeader2, 0, 0, 0, 255 )
    hud.setComponentBackgroundColor ( hHeader2, 127, 127, 0, 0 )
    hud.setComponentBorderColor ( hHeader2, 0, 0, 0, 0 )
    hud.setComponentOrigin ( hHeader2, hud.kOriginLeft )
    hud.setComponentPosition( hHeader2, 10, 30 )
    hud.setComponentSize ( hHeader2, 80, 7 )
    hud.setLabelFont (hHeader2, "DefaultFont" )
    hud.setLabelText( hHeader2, "Unike egenskaper.")
    hud.setLabelTextAlignment ( hHeader2, hud.kAlignLeft, hud.kAlignCenter )
    hud.setLabelTextHeight ( hHeader2, 65 )
    
    local hProperties = hud.newComponent ( hUser, hud.kComponentTypeContainer, "Properties" )
    
    hud.setComponentContainer( hProperties, hHolder ) 
    hud.setComponentOrigin ( hProperties, hud.kOriginCenter )
    hud.setComponentPosition( hProperties, 50, 15 )
    hud.setComponentSize ( hProperties, 90, 25)
    hud.setComponentBorderColor ( hProperties, 0, 0, 0, 255 )
    hud.setComponentBackgroundColor ( hProperties, 127, 127, 0, 0 )
    hud.setComponentShapeType ( hProperties, hud.kShapeTypeRoundRectangle )
    hud.setComponentShapeRoundRectangleCornerRadius ( hProperties, 3 )
    

    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------

