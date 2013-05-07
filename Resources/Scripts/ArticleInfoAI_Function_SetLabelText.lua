--------------------------------------------------------------------------------
--  Function......... : SetLabelText
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.SetLabelText ( sElementName, vValue, nLine)
--------------------------------------------------------------------------------
    
    local hHolder = hud.getComponent( this.getUser ( ), "main.ArticleInfoWindow" )
    local hLabel = hud.getComponent( this.getUser ( ), "main.label_"..nLine )
    local hData = hud.getComponent ( this.getUser ( ), "main.data_"..nLine ) 
   
    hud.setLabelTextAlignment ( hLabel, hud.kAlignLeft, hud.kAlignCenter )
    hud.setLabelTextAlignment ( hData, hud.kAlignRight, hud.kAlignCenter )
    hud.setLabelTextEncoding ( hLabel, hud.kEncodingUTF8 )
    hud.setLabelTextEncoding ( hData, hud.kEncodingUTF8 )

    hud.setLabelText( hLabel, sElementName )
    hud.setLabelText( hData, vValue )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
