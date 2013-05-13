--------------------------------------------------------------------------------
--  Function......... : SetLabelText
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.SetLabelText ( sElementName, vValue, nLine)
--------------------------------------------------------------------------------
    
    local hLabel = hud.getComponent( this.getUser ( ), "main.label_"..nLine )
    local hData = hud.getComponent ( this.getUser ( ), "main.data_"..nLine ) 
    hud.setLabelText( hLabel, sElementName )
    hud.setLabelText( hData, vValue )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
