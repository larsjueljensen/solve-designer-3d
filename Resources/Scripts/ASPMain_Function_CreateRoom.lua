--------------------------------------------------------------------------------
--  Function......... : CreateRoom
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.CreateRoom ( nID )
--------------------------------------------------------------------------------
	
    
    local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser ( ) 
    local hRoom = scene.getTaggedObject ( hScene, "User_Room" )

    
    local nSx = ((1+0.25)/100) * 100
    local nSy = ((1+0.71)/100) * 100
    local nSz = ((1+8.0955)/100) * 10
    
    local nSx2 = ((1+0.25)/100) * 100
    local nSy2 = ((1+0.71)/100) * 100
    local nSz2 = ((1+8.0955)/100) * 10
    
    local hLabelWidth = hud.getComponent ( hUser, "controls.WallLabel3" )
    local hLabelLength = hud.getComponent ( hUser, "controls.WallLabel1" )
    
    --update RoomVaribles
    
    user.setAIVariable ( hUser, "ASPRoom_AI", "nSx", nSx )
    user.setAIVariable ( hUser, "ASPRoom_AI", "nSy", nSy )
    user.setAIVariable ( hUser, "ASPRoom_AI", "nSz", nSz )
    
    user.setAIVariable ( hUser, "ASPRoom_AI", "nSx2", nSx2 )
    user.setAIVariable ( hUser, "ASPRoom_AI", "nSy2", nSy2 )
    user.setAIVariable ( hUser, "ASPRoom_AI", "nSz2", nSz2 )
    
    
    
--     local nSx2 = (1)*0.04   --tykkelse
--     local nSy2 = (1)        --høyde
--     local nSz2 = (1)        --Lengde
--     
    local nFloorScaleX = 1
    local nFloorScaleY = 1
    local nFloorScaleZ = 1
    
    local nFloorTransX = 0
    local nFloorTransY= 0
    local nFloorTransZ = 0
    
    local nWall_1_TransX = 0
    local nWall_1_TransY = 0
    local nWall_1_TransZ = 0
    local nHeight = 2.5 --Y parameter
    local nWall_2_TransX = 0
    local nWall_2_TransY = 0
    local nWall_2_TransZ = 0
    
    
    
    --****************
    --*Set Room size *
    --****************
    
    local nLength = this.RoomLength ( )
    local nWidth = this.RoomWidth ( )
    
    --Clear scene
    this.DestroyRoom (  )
    local nObjects = scene.getObjectCount ( hScene )
    
    ---Create room NULL
    local hRoom = scene.createRuntimeObject ( hScene, "Room_Dummy" )
    local sRoomTag = scene.setRuntimeObjectTag ( hScene, hRoom, "User_Room" )
    local sNullTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hRoom ) 
    local hWall1_collider = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall1_collider" )
    local hWall2_collider = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall2_collider" )
    local hWall3_collider = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall3_collider" )
    local hWall4_collider = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall4_collider" )
    
    if nID == 1
    then
    
    --Create Room 1
    log.message ( "Room ID = :"..nID )
    
    local nScaleX = nFloorScaleX * nWidth
    local nScaleY = nFloorScaleY * nHeight
    local nScaleZ = nFloorScaleZ * nLength
    
    --Create Floor
    --
    local hFloor = scene.createRuntimeObject ( hScene, "FloorASP" )
    local bOk = scene.setRuntimeObjectTag ( hScene, hFloor, "Floor" )

    
    object.addAIModel ( hFloor, "SliderTarget" )    
    object.setParent ( hFloor, hRoom, true )
    object.setScale ( hFloor, nScaleX, nScaleY, nScaleZ )
    object.setVisible ( hFloor, true )
    object.setTranslation (hFloor, 0, 0, 0 ,object.kGlobalSpace  )
    sensor.add ( hFloor, sensor.kShapeTypeBox )-- hObjectShape must be a shape
     --move colliders according to floorscale.
     --
     user.sendEvent( hUser, "ASPRoom_AI", "onSetColliders" )
      
     log.message ( "Created floor: ", nScaleX )
    
    --calculate the sensor offset and scale in function of boundingbox and object scale
    -- 
    local cx, cy, cz = object.getBoundingSphereCenter ( hFloor )
    local xFloor1, yFloor1, zFloor1 = object.getBoundingBoxMin ( hFloor )
    local xFloor2, yFloor2, zFloor2 = object.getBoundingBoxMax ( hFloor )
    local scx, scy, scz = object.getScale( hFloor )
     
    local sx = math.abs ( xFloor2 - xFloor1 )
    local sy = math.abs ( yFloor2 - yFloor1 )
    local sz = math.abs ( zFloor2 - zFloor1 )
     
    -- set sensor size and offset
    --
    sensor.setBoxCenterAt ( hFloor, 0, cx, cy, cz, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hFloor, 0, sx/scx, sy/scy, sz/scz )
     
    -- set sensor id
    -- 
    sensor.setIDAt ( hFloor, 0, 0 )
    sensor.setCategoryBitAt ( hFloor, 0, 1, true ) --Bit 1 = true: Object is of type room
    sensor.setCategoryBitAt ( hFloor, 0, 2, false )-- bit 2 false indicates hit object is if type floor
    --set floor material
    --
    shape.setMeshMaterial ( object.getChildAt ( hFloor, 0 ),"BohusFloor" )
        
    --Create ceiling.
    --
    local hCeiling = scene.createRuntimeObject ( hScene, "CeilingASP" )
    local bOk = scene.setRuntimeObjectTag ( hScene, hCeiling, "Ceiling" )
    object.setScale ( hCeiling, nScaleX, nScaleY, nScaleZ )
    shape.setMeshMaterial ( object.getChildAt( hCeiling, 0 ), "BohusCeiling" )
    object.setTranslation (hCeiling, 0, 25, 0, object.kGlobalSpace  )
    object.setRotation (hCeiling, 180  , 180, 0, object.kGlobalSpace  )
    object.setParent ( hCeiling, hRoom, true )

    --Create Wall 1 
    --
    local hWall_1_Null = scene.createRuntimeObject ( hScene, "Wall2" )
    scene.setRuntimeObjectTag ( hScene, hWall_1_Null, "Wall1_Null" )
    local hWall_1 = object.getChildAt ( hWall_1_Null, 0 )
    scene.setRuntimeObjectTag ( hScene, hWall_1, "Wall1" )
    object.addAIModel ( hWall_1, "SliderTarget" )
    object.setScale ( hWall_1_Null, nLength , nHeight   , nWidth )
    this.SetWallMaterial ( hWall_1, 0 )
    
    --shape.setMeshMaterial ( hWall_1, "Wallpaper")
    --Set sensor values
    sensor.add ( hWall_1, sensor.kShapeTypeBox )-- hObjectShape must be a shape
    --object.setParent ( hWall_1, hRoom, true )

    --calculate the sensor offset and scale in function of boundingbox and object scale
     --
    local cx, cy, cz = object.getBoundingSphereCenter ( hWall_1 )
    local xWall_1_1, yWall_1_1, zWall_1_1 = object.getBoundingBoxMin ( hWall_1 )
    local xWall_1_2, yWall_1_2, zWall_1_2 = object.getBoundingBoxMax ( hWall_1 )
    local scx, scy, scz = object.getScale( hWall_1 )
     
    local sx = math.abs ( xWall_1_2 - xWall_1_1 )
    local sy = math.abs ( yWall_1_2 - yWall_1_1 )
    local sz = math.abs ( zWall_1_2 - zWall_1_1 )
     
    -- set sensor size and offset
    --
    sensor.setBoxCenterAt ( hWall_1, 0, cx, cy, cz, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hWall_1, 0, sx/scx, sy/scy, sz/scz )
     
    -- set sensor id
    --
    sensor.setIDAt ( hWall_1, 0, 1 )
    sensor.setCategoryBitAt ( hWall_1, 0, 1, true )-- Bit nr 1(not 0 ) set to true means no translation adjustment on moving object
    sensor.setCategoryBitAt ( hWall_1, 0, 2, true )-- Bit nr 1(not 0 ) set to true means object is of type wall.
    object.setRotation (hWall_1_Null, 0, 90, 0, object.kGlobalSpace  )
    object.setTranslation ( hWall_1_Null, xFloor1, 0, zFloor1 , object.kGlobalSpace )
    object.matchTranslation ( hWall1_collider, hWall_1_Null, object.kGlobalSpace )
    object.matchRotation ( hWall1_collider, hWall_1_Null, object.kGlobalSpace )

    this.SetMoulding ( hWall_1_Null, 1 )

    --Create Wall 2
    --
    local hWall_2_Null = scene.createRuntimeObject ( hScene, "Wall2" )
    scene.setRuntimeObjectTag ( hScene, hWall_2_Null, "Wall2_Null" )
    local hWall_2 = object.getChildAt ( hWall_2_Null, 0 )
    scene.setRuntimeObjectTag ( hScene, hWall_2, "Wall2" )
    
    
    object.addAIModel ( hWall_2, "SliderTarget" )
    object.setScale ( hWall_2_Null, nLength , nHeight   , nWidth )
    
    this.SetWallMaterial ( hWall_2, 1 )

    --Set sensor values
    sensor.add ( hWall_2, sensor.kShapeTypeBox )-- hObjectShape must be a shape
    --object.setParent ( hWall_1, hRoom, true )

    --calculate the sensor offset and scale in function of boundingbox and object scale
     --
    local cx, cy, cz = object.getBoundingSphereCenter ( hWall_2 )
    local xWall_2_1, yWall_2_1, zWall_2_1 = object.getBoundingBoxMin ( hWall_2 )
    local xWall_2_2, yWall_2_2, zWall_2_2 = object.getBoundingBoxMax ( hWall_2 )
    local scx, scy, scz = object.getScale( hWall_1 )
     
    local sx = math.abs ( xWall_2_2 - xWall_2_1 )
    local sy = math.abs ( yWall_2_2 - yWall_2_1 )
    local sz = math.abs ( zWall_1_2 - zWall_1_1 )
     
    -- set sensor size and offset
    --
    sensor.setBoxCenterAt ( hWall_2, 0, cx, cy, cz, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hWall_2, 0, sx/scx, sy/scy, sz/scz )
     
    -- set sensor id
    --
    sensor.setIDAt ( hWall_2, 0, 1 )
    sensor.setCategoryBitAt ( hWall_2, 0, 1, true )-- Bit nr 1(not 0 ) set to true means no translation adjustment on moving object
    sensor.setCategoryBitAt ( hWall_2, 0, 2, true )-- Bit nr 1(not 0 ) set to true means object is of type wall.
    object.setRotation (hWall_2_Null, 0, 90, 0, object.kGlobalSpace  )
    object.setTranslation ( hWall_2_Null, xFloor1, 0, zFloor2 , object.kGlobalSpace )
    object.matchTranslation ( hWall2_collider, hWall_2_Null, object.kGlobalSpace )
    object.matchRotation ( hWall2_collider, hWall_2_Null, object.kGlobalSpace )
    this.SetMoulding ( hWall_2_Null, 2 )

    --Create Wall 3
    --
    local hWall_3_Null = scene.createRuntimeObject ( hScene, "Wall2" )
    scene.setRuntimeObjectTag ( hScene, hWall_3_Null, "Wall3_Null" )
    local hWall_3 = object.getChildAt ( hWall_3_Null, 0 )
    scene.setRuntimeObjectTag ( hScene, hWall_3, "Wall3" )
    
    object.addAIModel ( hWall_3, "SliderTarget" )
    object.setScale ( hWall_3_Null, nWidth , nHeight   , nLength )
    this.SetWallMaterial ( hWall_3, 2 )
    --Set sensor values
    sensor.add ( hWall_3, sensor.kShapeTypeBox )-- hObjectShape must be a shape

    --calculate the sensor offset and scale in function of boundingbox and object scale
     --
    local cx, cy, cz = object.getBoundingSphereCenter ( hWall_3 )
    local xWall_3_1, yWall_3_1, zWall_3_1 = object.getBoundingBoxMin ( hWall_3 )
    local xWall_3_2, yWall_3_2, zWall_3_2 = object.getBoundingBoxMax ( hWall_3 )
    local scx, scy, scz = object.getScale( hWall_3 )
     
    local sx = math.abs ( xWall_3_2 - xWall_3_1 )
    local sy = math.abs ( yWall_3_2 - yWall_3_1 )
    local sz = math.abs ( zWall_3_2 - zWall_3_1 )
     
    -- set sensor size and offset
    --
    sensor.setBoxCenterAt ( hWall_3, 0, cx, cy, cz, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hWall_3, 0, sx/scx, sy/scy, sz/scz )
     
    -- set sensor id
    --
    sensor.setIDAt ( hWall_3, 0, 1 )
    sensor.setCategoryBitAt ( hWall_3, 0, 1, true )-- Bit nr 1(not 0 ) set to true means no translation adjustment on moving object
    sensor.setCategoryBitAt ( hWall_3, 0, 2, true )-- Bit nr 1(not 0 ) set to true means object is of type wall.
    object.setRotation ( hWall_3_Null, 0, 0, 0, object.kGlobalSpace  )
    object.setTranslation ( hWall_3_Null, xFloor2, 0, zFloor1 , object.kGlobalSpace )
    object.matchTranslation ( hWall3_collider, hWall_3_Null, object.kGlobalSpace )
    object.matchRotation ( hWall3_collider, hWall_3_Null, object.kGlobalSpace )
    this.SetMoulding ( hWall_3_Null, 3 )
    
    --Create Wall 4
    --
    local hWall_4_Null = scene.createRuntimeObject ( hScene, "Wall2" )
    scene.setRuntimeObjectTag ( hScene, hWall_4_Null, "Wall4_Null" )
    local hWall_4 = object.getChildAt ( hWall_4_Null, 0 )
    scene.setRuntimeObjectTag ( hScene, hWall_4, "Wall4" )
    
    
    
    
    object.addAIModel ( hWall_4, "SliderTarget" )
    object.setScale ( hWall_4_Null, nWidth , nHeight   , nLength )
    
    this.SetWallMaterial ( hWall_4, 3 )
    --Set sensor values
    sensor.add ( hWall_4, sensor.kShapeTypeBox )-- hObjectShape must be a shape
    --object.setParent ( hWall_4, hRoom, true )

    --calculate the sensor offset and scale in function of boundingbox and object scale
     --
    local cx, cy, cz = object.getBoundingSphereCenter ( hWall_4 )
    local xWall_4_1, yWall_4_1, zWall_4_1 = object.getBoundingBoxMin ( hWall_4 )
    local xWall_4_2, yWall_4_2, zWall_4_2 = object.getBoundingBoxMax ( hWall_4 )
    local scx, scy, scz = object.getScale( hWall_4 )
     
    local sx = math.abs ( xWall_4_2 - xWall_4_1 )
    local sy = math.abs ( yWall_4_2 - yWall_4_1 )
    local sz = math.abs ( zWall_4_2 - zWall_4_1 )
     
    -- set sensor size and offset
    --
    sensor.setBoxCenterAt ( hWall_4, 0, cx, cy, cz, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hWall_4, 0, sx/scx, sy/scy, sz/scz )
     
    -- set sensor id
    --
    sensor.setIDAt ( hWall_4, 0, 1 )
    sensor.setCategoryBitAt ( hWall_4, 0, 1, true )-- Bit nr 1(not 0 ) set to true means no translation adjustment on moving object
    sensor.setCategoryBitAt ( hWall_4, 0, 2, true )-- Bit nr 1(not 0 ) set to true means object is of type wall.
    object.setRotation ( hWall_4_Null, 0, 0, 0, object.kGlobalSpace  )
    object.setTranslation ( hWall_4_Null, xFloor1, 0, zFloor1 , object.kGlobalSpace )
    object.matchTranslation ( hWall4_collider, hWall_4_Null, object.kGlobalSpace )
    object.matchRotation ( hWall4_collider, hWall_4_Null, object.kGlobalSpace )
    this.SetMoulding ( hWall_4_Null, 4 )
     
     object.setParent ( hWall_1_Null, hRoom, true )
     object.setParent ( hWall_2_Null, hRoom, true )
     object.setParent ( hWall_3_Null, hRoom, true )
     object.setParent ( hWall_4_Null, hRoom, true )

    end 
     
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
