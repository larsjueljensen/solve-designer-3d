--------------------------------------------------------------------------------
--  Function......... : LoadPreset
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.LoadPreset ( nArtNr)
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
    
    --local nModID = string.replace ( sName,"Article_","" )
    local tObjects = this.tObjectsInScene ( )
   
   --local nSceneModelCount  = this.nSceneModels ( )
   local nSceneModelCount = user.getAIVariable ( hUser, "MovingObject", "nSceneModels" )
   
   
   
   log.message ("User clicked: ", hBtnPressed,  "      Got name: ", sName  )
   
   local nCursorX, nCursorY = hud.getCursorPosition ( this.getUser ( ) )
   
   local hObject = scene.createRuntimeObject ( hScene, nArtNr )--TODO
    
    if hObject 
    
        then
            
            object.addAIModel ( hObject, "SliderTarget" )
            local nSceneModelCount  = nSceneModelCount + 1
            
            --update object counter
            
            user.setAIVariable ( hUser, "MovingObject", "nSceneModels", nSceneModelCount )
            
            --this.nSceneModels ( nSceneModelCount )
            object.setTranslation ( hObject, 0, 12, 0, object.kGlobalSpace )
            --object.setTransformOption ( hObject, object.kTransformOptionInheritsParentRotation, true )
            object.addAIModel ( hObject, "ObjectAI" )
            local sTag = "Article_"..nArtNr.."_"..nSceneModelCount
            scene.setRuntimeObjectTag ( hScene, hObject, sTag )
            
            table.add ( tObjects, sTag )
            
            log.message ( "Added to table index :", nSceneModelCount," ", "Value :", table.getAt ( tObjects, nSceneModelCount-1 ) )
           
    local hGroup = scene.getTaggedObject ( hScene, sTag )
    
    log.message ( "hLoad preset: ", hGroup )
            -- add a box sensor
             
            sensor.add ( hGroup , sensor.kShapeTypeBox ) --hObjectShape must be a shape
             
            --calculate the sensor offset and scale in function of boundingbox and object scale
             
            local cx, cy, cz = object.getBoundingSphereCenter ( hGroup )
            local x1, y1, z1 = object.getBoundingBoxMin ( hGroup )
            local x2, y2, z2 = object.getBoundingBoxMax ( hGroup)
            local scx, scy, scz = object.getScale( hGroup )
             
            local sx = math.abs ( x2-x1 )
            local sy = math.abs ( y2-y1 )
            local sz = math.abs ( z2-z1 )
             
            -- set sensor size and offset
            --sensor.setBoxCenterAt ( hObject, 0, cx, cy, cz, object.kLocalSpace )
            --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
            --sensor.setBoxSizeAt ( hObject, 0, sx/2, sy/2, sz/2 )
            --sensor.setBoxSizeAt ( hObject, 0, sx, sy, sz )

            --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
            -- set sensor id
           
           --***test 
            --sensor.setIDAt ( hObject, nSceneModelCount, nSceneModelCount )
            local nId = sensor.set
            --sensor.setIDAt ( hObject, 0, 0 )
            
            if hObject then
            
                    log.message ( nSceneModelCount)
                else
                    log.message ( "Object not creared." )
           end
           --***********************************************************
           --ENABLE DYNAMICS
           --***********************************************************'
           
           -- Create a composite body to an object
           --
           
           if ( dynamics.createCompositeBody ( hObject ) )then	
           
           -- Adding a specific composite body shape	
           --   	
           
           if ( dynamics.addCompositeBodyBoxGeometry ( hObject, sx, sy, sz, 0, 0, 0 ) )
            --if ( dynamics.addCompositeBodyBoxGeometry ( hObject, 4, 5, 2, 0, -1, 0 ) )   	
               then   	 	
               dynamics.enableDynamics   ( hObject, false)  	 	
               dynamics.enableCollisions ( hObject, false )  	 	
               dynamics.enableGravity	( hObject, false )  
               dynamics.enableRotations ( hObject, false )

               dynamics.setMass       ( hObject, 80) 			
               -- Finalizing the composite body so we can use it properly			
               --   			
                       if ( dynamics.finalizeCompositeBody ( hObject )  == false)   			
                       then       			
                       -- You can show an error message...   		
                       end   	
               end
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
           
           
           
           
           
           
           
  
--   if scene.getTaggedObject ( hScene, "Group_" ) == nil 
--         then
--         local hGroup  = scene.createRuntimeObject ( hScene, "Group" )
--         scene.setRuntimeObjectTag ( hScene, hGroup, "Group_")
--         
--         local hParent = scene.getTaggedObject ( hScene, "Group_" )
--         
--     
--         if hGroup then
--                 object.setTranslation ( hGroup, 0, 12, 0, object.kGlobalSpace )
--                 object.addAIModel ( hGroup, "ObjectAI" )
--                 
--                    
--                 -- add a box sensor
--                  
--                 sensor.add ( hParent, sensor.kShapeTypeBox ) --hObjectShape must be a shape
--                  
--                 --calculate the sensor offset and scale in function of boundingbox and object scale
--                  
--                 local cx, cy, cz = object.getBoundingSphereCenter ( hParent )
--                 local x1, y1, z1 = object.getBoundingBoxMin ( hParent )
--                 local x2, y2, z2 = object.getBoundingBoxMax ( hParent )
--                 local scx, scy, scz = object.getScale( hParent )
--                  
--                 local sx = math.abs ( x2-x1 )
--                 local sy = math.abs ( y2-y1 )
--                 local sz = math.abs ( z2-z1 )
--                  
--                 -- set sensor size and offset
--                  
--                 sensor.setBoxCenterAt ( hParent, 0, cx, cy, cz, object.kGlobalSpace )
--                 sensor.setBoxSizeAt ( hParent, 0, sx/scx, sy/scy, sz/scz )
--                  
--                 -- set sensor id
--                  
--                 sensor.setIDAt ( hParent, 0, nSceneModelCount )
--                 sensor.setCategoryBitAt ( hObject, 0, 1, false )
--     
--                 
--         else
--         log.message ( "No Group found." )
--         end
--         
--         
--         
--         
--         
--     else 
--     log.message (  "Skip. Group exists." )
--      log.message ("" )
--     end
--     
    --local hParent = scene.getTaggedObject ( hScene, "Group_" )
    
    
    
    
    
    
    --object.setParent ( hObject, hParent, true )
    --object.setParent ( hNavIcon, hObject, true )
    
	end
    
    
    --set default texture or selected texture on modell being loaded
    
    --this.sCurrentMaterial_1 ( )


--************old code

-- 	local nArtNr = this.ArticleID()
--     
--     
--     log.message ( "In Function-Loading art nr: ",nArtNr )
--     
--     local hScene = application.getCurrentUserScene ( )
--     
--     local nTargetX = this.nTargetPosX ( )
--     local nTargetY = this.nTargetPosY ( )
--     local nTargetZ = this.nTargetPosZ ( )
--     
--     local nObjects = this.nLoadedObjects ( )
--     
--     
--     
--     local hArticle = scene.createRuntimeObject (hScene, "LivingGroup_"..nArtNr)
--     this.nLoadedObjects ( nObjects + 1 )
--     scene.setRuntimeObjectTag ( application.getCurrentUserScene ( ), hArticle, "object_"..this.nLoadedObjects ( ) )
--     
--     local xMax,yMax,zMax = object.getBoundingBoxMax ( hArticle )
--     local xMin,yMin,zMin = object.getBoundingBoxMin ( hArticle )
--     
--     this.hSelectedObject( hArticle)
--     
--     
--     
--     --place object
--     object.setTranslation (hArticle, 0, 0.4, 0, object.kGlobalSpace  )
--     
--     
--        
--     if hArticle
--     then
--     this.bSceneIsEmpty ( false )
--     end
--     
--     
--     
--     --update target coordinates for next item.
--     local nObjectDepth = xMax - xMin
--     local nObjectHeight = yMax - yMin
--     local nObjectWidth = zMax - zMin 
--     
--     
--     
--     log.message ( "Boundingbox calculated - xMin = ",xMin," , xMax = ", xMax )
--     log.message ( "Boundingbox calculated - yMin = ",yMin," , yMax = ", yMax )
--     log.message ( "Boundingbox calculated - zMin = ",zMin," , zMax = ", zMax )
--     
--     
--     
--     log.message ( "Object depth = ", nObjectDepth )
--     log.message ( "Object height = ", nObjectHeight )
--     log.message ( "Object width = ", nObjectWidth )
--     
--     object.setTranslation (hArticle, nTargetX, nTargetY, nTargetZ, object.kGlobalSpace  )
--     log.message ( nTargetZ )
--     --this.nTargetPosZ (10 )
--     this.nTargetPosZ (nTargetZ+nObjectWidth)
-- 
--     
--     
--     
--     
--     --log.message ( this.nTargetPosX(xMax*10) )
--     --log.message ( this.nTargetPosZ(zMax) )
--     --Create graphic to show that the object is selected
--     --**********Create selection Box**************************
--     local nTargetX = this.nTargetPosX ( )
--     local nTargetY = this.nTargetPosY ( )
--     local nTargetZ = this.nTargetPosZ ( )
--     --local hArticle = scene.getObject ( hScene, "ASP_Modul_"..nArtNr)
--     
--     local hSelectionBox = scene.createRuntimeObject ( hScene, "SelectionBox" )
--     local xScale, yScale, zScale = object.getScale ( hArticle )
--     local xBoxScale, yBoxScale, zBoxScale = object.setScale (  hSelectionBox, xScale/2, yScale/2, zScale/2  )
--     object.matchTranslation ( hSelectionBox, hArticle, object.kGlobalSpace  )
--     object.setTranslation (hSelectionBox, nTargetX, nTargetY + 1, nTargetZ, object.kGlobalSpace  )
--     local x,y,z = sensor.getBoxSizeAt ( hArticle, 0 )
--     object.setVisible ( hSelectionBox, false )
--     
--     this.hActiveSelectIcon ( hSelectionBox )
--     

	
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
