--------------------------------------------------------------------------------
--  Function......... : updateInfoLabel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.updateInfoLabel ( hCurrentThumbnail )
--------------------------------------------------------------------------------
	
    
    local hUser = application.getCurrentUser ( )
    local hLabel = hud.getComponent ( hUser, this.sSliderName ( )..".InfoLabelText" )
    
    local sArticleNumber = hud.getComponentBackgroundImageName ( hCurrentThumbnail )
    
    local htArticleCache = user.getAIVariable ( application.getCurrentUser ( ), "DesignerPlugin_Main", "htArticleCache" )
    local hXml = xml.newInstance ( )  
    xml.createFromString ( hXml,  hashtable.get ( htArticleCache, sArticleNumber ) )
    local sInfoText = this.getDescriptionFromElement ( xml.getRootElement ( hXml ) ) 
    
    hud.setLabelText ( hLabel , sInfoText )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
