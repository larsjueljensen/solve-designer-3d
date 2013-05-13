--------------------------------------------------------------------------------
--  Function......... : createComponent
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.createComponent ( hHolder, sTagPrefix, i, nPosX, nPosY, nSizeX, nSizeY )
--------------------------------------------------------------------------------
	
    local hComponent = hud.newComponent( this.getUser ( ), hud.kComponentTypeLabel, sTagPrefix..i)
    
    hud.setComponentPosition( hComponent, nPosX, nPosY )        
    hud.setComponentSize ( hComponent, nSizeX, nSizeY )
    hud.setComponentContainer( hComponent, hHolder ) 
    hud.setComponentOrigin ( hComponent, hud.kOriginLeft )
    hud.setComponentZOrder ( hComponent, 130 )
    hud.setComponentForegroundColor ( hComponent, 0, 0, 0, 255 )
    hud.setComponentBorderColor ( hComponent, 0, 0, 0, 0 )

    hud.setLabelTextAlignment ( hComponent, hud.kAlignLeft, hud.kAlignCenter )
    hud.setLabelTextEncoding ( hComponent, hud.kEncodingUTF8 )
    hud.setLabelFont (hComponent, "arial" )
    hud.setLabelTextHeight ( hComponent, 50 )
    
    return hComponent

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
---
