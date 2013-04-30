--------------------------------------------------------------------------------
--  Handler.......... : on2DCam
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.on2DCam ( n )
--------------------------------------------------------------------------------
	
    --log.message ( "Camera selected, received: ", n )
    this.HighLightCam (  )
    
    local hTarget = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Floor" )
    
    local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    local hCam = application.getCurrentUserActiveCamera (  )
    local h2DCam = scene.getTaggedObject ( hScene,  "2DCam" )
    local hRoom = scene.getTaggedObject ( hScene, "User_Room"  )
    local hTarget = scene .getTaggedObject ( hScene, "Wall3"  )
    local sCamera   
    local bCamType
    --store cam position
    local x,y,z = object.getTranslation ( hCam, object.kGlobalSpace )
    --log.message ( "********Cam coordinates = ", x, " ", y , " " , z )
    
    
        if n == 0 then
        --log.message ( "2D camera selected" )
        elseif n == 1 then
       -- log.message ( "3D camera selected" )
        end

    
    
   
    
---------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
