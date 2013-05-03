--------------------------------------------------------------------------------
--  Function......... : SetLabelText
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.SetLabelText ( )
--------------------------------------------------------------------------------
	log.message ( "Settting label text" )
    
    local hHolder = hud.getComponent( this.getUser ( ), "main.ArticleInfoWindow" )
    local hLabel = hud.getComponent( this.getUser ( ), "main.label_0" )
    
    hud.setLabelTextAlignment ( hLabel, hud.kAlignLeft, hud.kAlignLeft )
    --hud.setLabelText( hLabel, "Bredde" )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
