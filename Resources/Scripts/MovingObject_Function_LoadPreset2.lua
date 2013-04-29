--------------------------------------------------------------------------------
--  Function......... : LoadPreset2
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.LoadPreset2 ( )
--------------------------------------------------------------------------------
	    local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser ( )
    local hList1 = hud.getComponent ( hUser, "MoveObjectHUD.ModulesList_1" )
    local nPosX, nPosY = hud.getCursorPosition (  hUser )
    local hBtnPressed = hud.getComponentAtPoint ( hUser, nPosX, nPosY )
    local nIndex = hud.getUnderCursorListItem ( hUser )
    local sName
    
    if nIndex ~= nil then
     
     sName= hud.getListItemIconAt (  hList1, nIndex, 0) 
    
    else
    end
    
    local nModID = string.replace ( sName,"Living_mod_","" )
    --local nModID = nArtNr
    local tObjects = this.tObjectGroup ( )
   
   local nSceneModelCount  = this.nSceneModels ( )
   
   log.message ("User clicked: ", hBtnPressed,  "      Got name: ", sName  )
   
   local nCursorX, nCursorY = hud.getCursorPosition ( this.getUser ( ) )
   
   local hObject = scene.createRuntimeObject ( hScene, "Living_mod_"..nModID )--TODO
    
    if hObject 
    
        then
            
            object.addAIModel ( hObject, "SliderTarget" )
            local nSceneModelCount  = nSceneModelCount + 1
            this.nSceneModels ( nSceneModelCount )
            object.setTranslation ( hObject, 0, 4, 0, object.kGlobalSpace )
            --object.setTransformOption ( hObject, object.kTransformOptionInheritsParentRotation, true )
            object.addAIModel ( hObject, "ObjectAI" )
            local sTag = "Living_mod_"..nModID.."_"..nSceneModelCount
            scene.setRuntimeObjectTag ( hScene, hObject, sTag )
            
            table.add ( tObjects, sTag )
            
            log.message ( "Added to table index :", nSceneModelCount," ", "Value :", table.getAt ( tObjects, nSceneModelCount-1 ) )
           
    
            -- add a box sensor
             
            sensor.add ( hObject, sensor.kShapeTypeBox ) --hObjectShape must be a shape
             
            --calculate the sensor offset and scale in function of boundingbox and object scale
             
            local cx, cy, cz = object.getBoundingSphereCenter ( hObject )
            local x1, y1, z1 = object.getBoundingBoxMin ( hObject )
            local x2, y2, z2 = object.getBoundingBoxMax ( hObject )
            local scx, scy, scz = object.getScale( hObject )
             
            local sx = math.abs ( x2-x1 )
            local sy = math.abs ( y2-y1 )
            local sz = math.abs ( z2-z1 )
             
            -- set sensor size and offset
            sensor.setBoxCenterAt ( hObject, 0, cx, y1, cz, object.kLocalSpace )
            --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
            --sensor.setBoxSizeAt ( hObject, 0, sx/2, sy/2, sz/2 )
            sensor.setBoxSizeAt ( hObject, 0, sx, sy, sz )

            --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
            -- set sensor id
           
           --***test 
            --sensor.setIDAt ( hObject, nSceneModelCount, nSceneModelCount )
            local nId = sensor.set
            sensor.setIDAt ( hObject, 0, 0 )
            
            if hObject then
            
                    log.message ( this.nSceneModels() )
                else
                    log.message ( "Object not creared." )
           end
           
           --*****Create NavIcon*******
           --****************************
           
            --local hNavIcon = scene.createRuntimeObject ( hScene, "ASP_Rotate" )
    
--             if hNavIcon 
--                 then
--                     
--                     object.setScale ( hNavIcon, 0.002, 0.002, 0.002 )
--                     
--                     --object.setTransformOption ( hObject, object.kTransformOptionInheritsParentRotation, true )
--                     object.addAIModel ( hNavIcon, "ObjectAI" )
--                     local sTag = "NavIcon_"..nSceneModelCount
--                     scene.setRuntimeObjectTag ( hScene, hNavIcon, sTag )
--                     --object.matchTranslation ( hNavIcon, hObject, object.kGlobalSpace )
--                     sensor.add ( hNavIcon, sensor.kShapeTypeBox )
--                     --log.message ( object.getChildCount ( hParent  ) )
--                     this.hSelectIcon ( hNavIcon)
--                     object.setVisible ( hNavIcon, false )
--                     
--                     
--                     
--                     --table.add ( tObjects, sTag )
--                     
--                     --log.message ( "Added to table ndex :", nSceneModelCount," ", "Value :", table.getAt ( tObjects, nSceneModelCount-1 ) )
--                     
--                     
--                     
--             
--                     -- add a box sensor
--                      
--                     --sensor.add ( hNavIcon, sensor.kShapeTypeBox ) --hObjectShape must be a shape
--                     object.setTranslation ( hNavIcon, 0, 1.7, 0, object.kGlobalSpace )
--                      
--                     --calculate the sensor offset and scale in function of boundingbox and object scale
--                      
--                     local cx, cy, cz = object.getBoundingSphereCenter ( hNavIcon )
--                     local x1, y1, z1 = object.getBoundingBoxMin ( hNavIcon )
--                     local x2, y2, z2 = object.getBoundingBoxMax ( hNavIcon )
--                     local scx, scy, scz = object.getScale( hNavIcon )
--                      
--                     local sx = math.abs ( x2-x1 )
--                     local sy = math.abs ( y2-y1 )
--                     local sz = math.abs ( z2-z1 )
--                      
--                     -- set sensor size and offset
--                     
--                     
--                      
--                     sensor.setBoxCenterAt ( hNavIcon, 0, cx, cy, cz, object.kLocalSpace )
--                     --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
--                     sensor.setBoxSizeAt ( hNavIcon, 0, sx/2, sy/2, sz/2 )
--                      
--                     -- set sensor id
--                      
--                     sensor.setIDAt ( hNavIcon, nSceneModelCount, nSceneModelCount )
-- --                     if hNavIcon then
-- --                     
-- --                     end
-- --                             
-- --                             
-- --                             
-- --                             
--                              
--                             log.message ( this.nSceneModels() )
--                         else
--                             log.message ( "Icon not created." )
--                    end
-- 
           
           
           
           
           
           
           
  
  if scene.getTaggedObject ( hScene, "Group_" ) == nil 
        then
        local hGroup  = scene.createRuntimeObject ( hScene, "Group" )
        scene.setRuntimeObjectTag ( hScene, hGroup, "Group_")
        
        local hParent = scene.getTaggedObject ( hScene, "Group_" )
        
    
        if hGroup then
                object.setTranslation ( hGroup, 0, 12, 0, object.kGlobalSpace )
                object.addAIModel ( hGroup, "ObjectAI" )
                
                   
                -- add a box sensor
                 
                sensor.add ( hParent, sensor.kShapeTypeBox ) --hObjectShape must be a shape
                 
                --calculate the sensor offset and scale in function of boundingbox and object scale
                 
                local cx, cy, cz = object.getBoundingSphereCenter ( hParent )
                local x1, y1, z1 = object.getBoundingBoxMin ( hParent )
                local x2, y2, z2 = object.getBoundingBoxMax ( hParent )
                local scx, scy, scz = object.getScale( hParent )
                 
                local sx = math.abs ( x2-x1 )
                local sy = math.abs ( y2-y1 )
                local sz = math.abs ( z2-z1 )
                 
                -- set sensor size and offset
                 
                sensor.setBoxCenterAt ( hParent, 0, cx, cy, cz, object.kGlobalSpace )
                sensor.setBoxSizeAt ( hParent, 0, sx/scx, sy/scy, sz/scz )
                 
                -- set sensor id
                 
                sensor.setIDAt ( hParent, 0, nSceneModelCount )
                sensor.setCategoryBitAt ( hObject, 0, 1, false )
    
                
        else
        log.message ( "No Group found." )
        end
        
        
        
        
        
    else 
    log.message (  "Skip. Group exists." )
     log.message ("" )
    end
    
    local hParent = scene.getTaggedObject ( hScene, "Group_" )
    object.setParent ( hObject, hParent, true )
    --object.setParent ( hNavIcon, hObject, true )
    
	end
    
    
    --set default texture or selected texture on modell being loaded
    
    this.sCurrentMaterial_1 ( )
    
    
    --******************************************************
--     if ( dynamics.createCompositeBody ( hObject ) )
--         then
--         -- Adding a specific composite body shape
--         --
--         if ( dynamics.addCompositeBodySphereGeometry ( hObject, 2, 0, 0, 0 ) )
--         then
--          
--         dynamics.enableDynamics ( hObject, false )
--         dynamics.enableCollisions ( hObject, true )
--         dynamics.enableGravity ( hObject, false )
--         dynamics.setMass ( hObject, 80 )
--          
--         -- Finalizing the composite body so we can use it properly
--         --
--             if ( dynamics.finalizeCompositeBody ( hObject ) == false)
--             then
--             -- You can show an error message...
--             end
--         end
--     end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
