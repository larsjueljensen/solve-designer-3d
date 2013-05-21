--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onInit (  )
--------------------------------------------------------------------------------
	
	application.setCurrentUserScene ( "BohusScene" )
    local hUser = application.getCurrentUser ( )
    application.setOption ( application.kOptionTexturesQuality, 2 )
    application.setOption ( application.kOptionUseAntialiasingFilter, 1)
    this.Preload ( )

    hud.newTemplateInstance ( hUser, "Bohus_main", "main" )

    this.LogToWeb ( "ASPMain")
    system.openURL ( "javascript:onPluginStarted();", "" )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
