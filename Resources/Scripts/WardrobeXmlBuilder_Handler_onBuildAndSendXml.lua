--------------------------------------------------------------------------------
--  Handler.......... : onBuildAndSendXml
--  Author........... : Lars Juel Jensen
--  Description...... : Builds the wardrobe XML string and sends it to the web page
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.onBuildAndSendXml ( sName )
--------------------------------------------------------------------------------
	
	local sWardrobeXml = this.buildWardrobe ( application.getCurrentUserScene ( ) )
	user.sendEvent ( this.getUser ( ), "DesignerPlugin_Main", "onSendWardrobeXmlToWeb", sName, sWardrobeXml )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
