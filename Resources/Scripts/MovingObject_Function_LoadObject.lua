--------------------------------------------------------------------------------
--  Function......... : LoadObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.LoadObject ( nModID )
--------------------------------------------------------------------------------
	
	    local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser ( )
    local hList1 = hud.getComponent ( hUser, "MoveObjectHUD.ModulesList_1" )
    local nPosX, nPosY = hud.getCursorPosition (  hUser )
    local hBtnPressed = hud.getComponentAtPoint ( hUser, nPosX, nPosY )
    local nIndex = hud.getUnderCursorListItem ( hUser )
    local sName
    
    local hObjectsTable = user.getAIVariable ( hUser, "ASPMain", "tCachedObjects" )
    
    local nSize = table.getSize ( hObjectsTable )
    
    log.message ( "Objecttable has ", nSize-1, " entries" )
    
    
    
    
    log.message ( "OBJECTSTABLE = ", hObjectsTable )
    
    if nIndex ~= nil then
     
    sName= hud.getListItemIconAt (  hList1, nIndex, 0) 
    
    else
    end
    
    --check param against table
    
    local bFile = table.contains ( hObjectsTable, nModID )
    
    log.message ( "TABLE CHECKED: ", bFile )
    
    
    --local nModID = string.replace ( sName,"Living_mod_","" )
    --local nModID = nArtNr
    local tObjects = this.tObjectGroup ( )
   
   local nSceneModelCount  = this.nSceneModels ( )
   
   log.message ("User clicked: ", hBtnPressed,  "      Got name: ", sName  )
   
   local nCursorX, nCursorY = hud.getCursorPosition ( this.getUser ( ) )
   
   --local bFile = cache.getFileStatus ( ""..nModID.."" )
   
   log.message ( "Load Object status in cache: ", bFile )
   
   if bFile == true
   then
   local hObject = scene.createRuntimeObject ( hScene, ""..nModID )--TODO
  
    
    if hObject 
    
        then
            
            object.addAIModel ( hObject, "SliderTarget" )
            local nSceneModelCount  = nSceneModelCount + 1
            this.nSceneModels ( nSceneModelCount )
            object.setTranslation ( hObject, 0, 0.2, 0, object.kGlobalSpace )
            --object.setTransformOption ( hObject, object.kTransformOptionInheritsParentRotation, true )
            object.addAIModel ( hObject, "ObjectAI" )
            local sTag = ""..nModID.."_"..nSceneModelCount
            scene.setRuntimeObjectTag ( hScene, hObject, sTag )
            
            table.add ( tObjects, sTag )
            
            log.message ( "Added to table index :", nSceneModelCount," ", "Value :", table.getAt ( tObjects, nSceneModelCount-1 ) )
           
    
            -- add a box sensor
             
            local bSensor = sensor.add ( hObject, sensor.kShapeTypeBox ) --hObjectShape must be a shape
             
            --calculate the sensor offset and scale in function of boundingbox and object scale
             
            local cx, cy, cz = object.getBoundingSphereCenter ( hObject )
            local x1, y1, z1 = object.getBoundingBoxMin ( hObject )
            local x2, y2, z2 = object.getBoundingBoxMax ( hObject )
            local scx, scy, scz = object.getScale( hObject )
             
            local sx = math.abs ( x2-x1 )
            local sy = math.abs ( y2-y1 )
            local sz = math.abs ( z2-z1 )
             
            -- set sensor size and offset
            sensor.setBoxCenterAt ( hObject, 0, cx, cy, cz, object.kLocalSpace )
            --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
            --sensor.setBoxSizeAt ( hObject, 0, sx/2, sy/2, sz/2 )
            sensor.setBoxSizeAt ( hObject, 0, sx, sy, sz )

            --sensor.setBoxSizeAt ( hObject, 0, sx/scx, sy/scy, sz/scz )
            -- set sensor id
            if ( dynamics.createCompositeBody ( hObject ) )
                then
                -- Adding a specific composite body shape
                --
                    if ( dynamics.addCompositeBodyBoxGeometry ( hObject, sx, sy , sz, 0, cy, 0 ) )
                    then
                     
                    dynamics.enableDynamics ( hObject, true )
                    dynamics.enableCollisions ( hObject, true )
                    dynamics.enableGravity ( hObject, true )
                    dynamics.setMass ( hObject, 100 )
                    dynamics.setFriction (hObject, 100 )
                    dynamics.setBounce ( hObject, 0 )
                    dynamics.setAngularDamping ( hObject, 100 )
                    dynamics.setLinearDamping ( hObject, 100 )

                     
                    -- Finalizing the composite body so we can use it properly
                    --
                        if ( dynamics.finalizeCompositeBody ( hObject ) == false)
                        then
                        -- You can show an error message...
                        end
                    end
                end


           
           --***test 
            --sensor.setIDAt ( hObject, nSceneModelCount, nSceneModelCount )
            local nId = sensor.set
            sensor.setIDAt ( hObject, 0, 0 )
            
            if hObject then
            
                    log.message ( this.nSceneModels() )
                else
                    log.message ( "Object not creared." )
           end
           
	end
     else 
   end 
    
    --set default texture or selected texture on modell being loaded
    
    this.sCurrentMaterial_1 ( )
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
