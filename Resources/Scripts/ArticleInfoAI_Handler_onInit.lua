--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.onInit (  )
--------------------------------------------------------------------------------
	
	this.createItems ( )
    this.SetLabelText ( )
    this.sendEvent ( "onShowArticleInfo" )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
