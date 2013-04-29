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
   --log.enable ( true )
    
    -- Load scene
    --    
    application.setOption ( application.kOptionTexturesQuality, 2 )
    this.Preload ( )
    -- Create HUD
    -- 
    hud.newTemplateInstance ( hUser, "Bohus_main", "main" )
    --Set user camera
    --
    object.setAIVariable ( application.getCurrentUserActiveCamera ( ), "ASPCamera", "bIs3dCamera", true )
    --scene.setDynamicsTimeStep ( application.getCurrentUserScene( ), 1/120 )
        
    --user.sendEvent ( hUser, "DesignerPlugin_Main", "onLogToWeb", "DesignerPlugin_Main.onInit (  )"  )
   this.LogToWeb ( "ASPMain")
    system.openURL ( "javascript:onPluginStarted();", '' )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
