--------------------------------------------------------------------------------
--  Handler.......... : onSwitchCamera
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onSwitchCamera ( nCam )
--------------------------------------------------------------------------------
	
    log.message ( "Camera selected, received: ", nCam )
    this.HighLightCam (  )
    local hFloor = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Floor" )
    local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    local hCam = application.getCurrentUserActiveCamera (  )
    
    local hLightset = scene.getTaggedObject ( hScene, "LightSet" )
    local hPointLight = scene.getTaggedObject ( hScene, "PointLight" )
    

    --light.setActive ( hLightset, false )
    
    scene.setObjectTag ( hScene, hCam, "3DCam" )
    
    local h2DCam = scene.getTaggedObject ( hScene,  "2DCam" )
    local hRoom = scene.getTaggedObject ( hScene, "User_Room"  )
    local hTarget = scene .getTaggedObject ( hScene, "Wall3"  )
    local sCamera   
    local bCamType
    --store cam position
    local x,y,z = object.getTranslation ( hCam, object.kGlobalSpace )
    
    
    log.message ( "************************Handles*********************" )
    
    log.message ( "Object to hide = ", hFloor )
    
    log.message ( "********Cam coordinates = ", x, " ", y , " " , z )
    
    if nCam == 0 then
    
    this.bCamera2DMode ( true )
    object.setVisible ( hLightset, false )
    --object.setVisible ( hPointLight, false )

    
    --h2DCam = scene.getTaggedObject ( hScene, "2DCam" )
    
    application.setCurrentUserActiveCamera ( h2DCam )
    h2DCam = application.getCurrentUserActiveCamera ( )
    
    
    --object.setRotation ( h2DCam, -90, 0, 0, object.kLocalSpace )
    object.setTranslation ( h2DCam, 0, 1500,0,  object.kGlobalSpace )
    camera.setFieldOfView ( h2DCam, 2)
    camera.setMaxViewDistance ( h2DCam, 3500 )
    this.Set2DParameters (  )
    
    --hide floor
    
    object.setVisible ( hFloor, false )
    
    log.message ( "h2DCam = ", h2DCam )
       
    elseif nCam == 1 then
    this.bCamera2DMode ( false )
    object.setVisible ( hLightset, true )
    object.setVisible ( hPointLight, true )


    hCam = scene.getTaggedObject ( hScene, "3DCam" )

    application.setCurrentUserActiveCamera ( hCam )
    this.Set3DParameters (  )

    
    if hFloor then
        object.setVisible ( hFloor, true )
    end
    
    log.message ( "hCam = ", hCam )
    end
    
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
