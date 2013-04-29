--------------------------------------------------------------------------------
--  Handler.......... : onInitSession
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onInitSession (  urlBase,  queryString )
--------------------------------------------------------------------------------
	this.LogToWeb ( "onInitSession urlbase - "..urlBase  )
	this.LogToWeb ( "onInitSession queryString - "..queryString  )
    
    this.URLbase ( urlBase )
    this.commonQueryString ( queryString )
    
    this.LogToWeb ( "onInitSession urlbase - "..this.URLbase ( ) )
    this.LogToWeb ( "onInitSession cqs - "..this.commonQueryString ( ) )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
