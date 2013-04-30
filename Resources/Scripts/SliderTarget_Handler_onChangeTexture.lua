--------------------------------------------------------------------------------
--  Handler.......... : onChangeTexture
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function SliderTarget.onChangeTexture ( sTextureName, nMode, r, g, b )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser ( )
    local tTable = user.getAIVariable ( hUser, "MovingObject", "tTextureTable" )
    
    

    --change the texture 
    log.message ( "In fnc SliderTarget.onChangeTexture: ", sTextureName )
    
    local hCheck_1 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_3" )
    local hCheck_2 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_4" )
    local hCheck_3 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_5" )
    local hCheck_4 = hud.getComponent ( hUser, "HUD_sidemenu.CheckBox_6" )
    
    --Texture table
    
    log.message ( "Got handle to tTextureTable :", tTable )
    log.message ( this.getObject ( ) )
    
    local bCheck1, bCheck2, bCheck3, bCheck4
       
    local bState_1 = hud.getCheckState ( hCheck_1 )
    log.message ( "CheckState = ", bState_1  )
    
    local bState_2 = hud.getCheckState ( hCheck_2 )
    log.message ( "CheckState = ", bState_2  )

    local bState_3 = hud.getCheckState ( hCheck_3 )
    log.message ( "CheckState = ", bState_3  )

    local bState_4 = hud.getCheckState ( hCheck_4 )
    log.message ( "CheckState = ", bState_4  )
        
    local hTarget = user.getAIVariable ( hUser, "MovingObject", "hSelectedObject" )
    
    this.hTargetObject ( hTarget )
    this.sTexture ( sTextureName )
    log.message ( "Target Object = ", hTarget )

    local hParent = object.getParent ( hTarget)
    
   
    
    log.message ( "hParent = ", hParent  )
    
    local sTag1 = "User_Room"
    local sTag2 = "Group_"
    
    local sParentTag = scene.getObjectTag ( hScene, hParent )
    log.message ( "ParentTag = ", sParentTag )
    local sObjectTag = scene.getObjectTag ( hScene, hTarget )
    log.message ( "ObjectTag = ", sObjectTag )
    
    local bIsRoom = string.compare ( sTag1, sParentTag )
    local bIsObject = string.compare ( sTag2, sParentTag )
    
    log.message ( "bIsRoom var = ", bIsRoom )
    log.message ( "bIsObject var = ", bIsObject )
    
    local nRoomPart = sensor.getCategoryBitAt ( hTarget, 0, 2 )

    
        if bIsObject == 0 then
        
            log.message ( "User Selected Object for editing." )
            user.setAIVariable ( hUser, "ASPMain", "nEditMode", 0 )
        else
            log.message ( "User Selected Room for editing." )
            user.setAIVariable ( hUser, "ASPMain", "nEditMode", 1 )
        end
        
        if bIsRoom == 0 then
        --do some stuff
        log.message ( "User Selected room for editing." )
        
        
        if nRoomPart == true then --Object is type wall
        
        local bResult = shape.overrideMeshSubsetMaterialEffectMap0 ( this.hTargetObject ( ), 1, sTextureName, shape.kMapTypeTexture )
        --shape.overrideMeshMaterialDiffuse ( this.hTargetObject ( ), 0.5, 0.5, 0.5, 1 )
        --shape.overrideMeshMaterialDiffuse ( this.hTargetObject ( ), r, g, b, 1 )
        
        else --object is type floor
        local bResult = shape.overrideMeshSubsetMaterialEffectMap0 ( this.hTargetObject ( ), 0, sTextureName, shape.kMapTypeTexture )
        log.message (  ) 
        end --end if RoomPart type

        end -- endif bIsRoom
        
        local nChildObjects
    
    
        if bIsObject == 0 then
            local nParts = object.getChildCount ( hParent )
            
            log.message ( "hParent has children  = ", nParts  )
        
            if nParts then
            for i = 2, nParts-1
            do 
                local hPart = object.getChildAt( hParent, i )
                log.message ( "Got handle to Group child = ", hPart )
                nChildObjects = object.getChildCount ( hPart )
                log.message ( nChildObjects )
            
                local hChild
                local nSubsets = shape.getMeshSubsetCount ( hPart )
                
                log.message ( "nSubsets = ", nSubsets )
            
                if nSubsets > 1 then
            
                    if bState_1 == true then
                    log.message ( "User selection 1 = ", bState_1 )
                    
                    log.message ("sTextureName: ", sTextureName  )
                    log.message ("MeshSubsetMaterialEffectMap0: ", shape.getMeshSubsetMaterialEffectMap0 ( hPart, 0 ) )
                    --shape.overrideMeshMaterialEffectMap0 ( hPart, "Mat_1" , shape.kMapTypeTexture)
                    shape.overrideMeshSubsetMaterialEffectMap0 ( hPart, 1, sTextureName, shape.kMapTypeTexture )
                    table.setAt ( tTable, 1, sTextureName )
                    end
            
                    if bState_2 == true then
                        log.message ( "User selection 1 = ", bState_2 )
                        
                        log.message ( sTextureName  )
                                
                        shape.overrideMeshSubsetMaterialEffectMap0 ( hPart, 0, sTextureName, shape.kMapTypeTexture )
                        table.setAt ( tTable, 0, sTextureName )
                    end

                    if bState_3 == true then
                        log.message ( "User selection 1 = ", bState_3 )
                        log.message (sTextureName  )
                        shape.overrideMeshSubsetMaterialEffectMap0 ( hPart, 2, sTextureName, shape.kMapTypeTexture )
                        table.setAt ( tTable, 2, sTextureName )
                    end  --endif bSteate 3 
                    
                elseif   nSubsets == 1  then 
                
                    log.message ( "bState_4 = ", bState_4 )
                    log.message ( "bSubsets = ", bState_4 )

                        if ( bState_4 == true ) then
                            log.message ( "User selection 1 = ", bState_4 )
                            
                            log.message (sTextureName  )
                            
                            shape.overrideMeshSubsetMaterialEffectMap0 ( hPart, 0, sTextureName, shape.kMapTypeTexture )
                            table.setAt ( tTable, 3, sTextureName )
                        end 

                        
                end --endif nSubsets
                
            end     


        end
        
        
        
    

    
    

--         for i= 0, nChildObjects-1 do
--         hChild = object.getChildAt( hPart, i )
--         log.message ( "Got childobject: ", hChild )
--        
--         end
     end

    
--else

--end    
    
    --Close editor dialogwnd
    --hud.callAction( hUser, "HUD_sidemenu.CloseToolsWindow" )
	
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
