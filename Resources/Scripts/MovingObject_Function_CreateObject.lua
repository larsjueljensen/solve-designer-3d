             --------------------------------------------------------------------------------
--  Function......... : CreateObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.CreateObject ( hObject, nHitDist, nHitSurfaceID, x, y, z )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser ( )
    local hList1 = hud.getComponent ( hUser, "MoveObjectHUD.ModulesList_1" )
    local nPosX, nPosY = hud.getCursorPosition (  hUser )
    local hBtnPressed = hud.getComponentAtPoint ( hUser, nPosX, nPosY )
    local nIndex = this.nModelID ( )
    local sName
    local htDefaultRot = user.getAIVariable ( hUser, "ASPMain", "htRotation" )
    local hTextures = this.tTextureTable ( )
    local nModID = this.nModelID ( )
    local tObjects = this.tObjectGroup ( )
    local nSceneModelCount  = this.nSceneModels ( )
    local nCursorX, nCursorY = hud.getCursorPosition ( this.getUser ( ) )
    local sArticleNumber = this.sListSelection( )

    this.sAddedArticle ( sArticleNumber )
    
    local hObject = scene.createRuntimeObject ( hScene, sArticleNumber.."/"..sArticleNumber  )
    local uid = this.nUID ( )
   
    this.hNewObject ( hObject )
    this.hLastObject ( hObject )
   
    local z = 0
    local x = 0
   
    local nRotation = hashtable.get ( htDefaultRot, this.sListSelection ( ) )

    if hObject then

        local Ox, Oy, Oz = object.getTranslation ( hObject, object.kGlobalSpace )
        object.addAIModel ( hObject, "SliderTarget" )
        local nSceneModelCount  = nSceneModelCount + 1
        this.nSceneModels ( nSceneModelCount )

        local sTag = uid.."_"..nSceneModelCount
        scene.setRuntimeObjectTag ( hScene, hObject, sTag )

        object.setVisible ( hObject, false  )
        object.getChildCount (  hObject )
        table.add ( tObjects, sTag )
        hashtable.add ( this.htLock ( ), sTag, 0 )
            
        this.RecordAction ( sTag, 0 )
       
        --calculate the sensor offset and scale in function of boundingbox and object scale
        local cx, cy, cz = object.getBoundingSphereCenter ( hObject )
        local x1, y1, z1 = object.getBoundingBoxMin ( hObject )
        local x2, y2, z2 = object.getBoundingBoxMax ( hObject )
        local scx, scy, scz = object.getScale( hObject )
         
        local sx = math.abs ( x2-x1 )
        local sy = math.abs ( y2-y1 )
        local sz = math.abs ( z2-z1 )
       
        local bTableIsEmpty = table.isEmpty ( hTextures )
           
        if bTableIsEmpty then
           
           local nChildren = object.getChildCount ( hObject )
           local nSubsets = shape.getMeshSubsetCount ( hObject )
           
            if nSubsets == 1 then
                table.insertAt ( hTextures, 3, sTexture )
            else
                for i = 0, nSubsets - 1 do
                    local hChildPart = object.getChildAt ( hObject, i )
                    table.add ( hTextures, sTexture )
                end 
            end
                   
        else
            local nSubsets = shape.getMeshSubsetCount ( hObject )
            if nSubsets == 1 then
                if this.HighlightState (  ) == true then
                    this.HighLightObject (  )
                end
            else
                       
                for i = 0, nSubsets - 1 do
                    local sTexture = table.getAt ( hTextures, i )
                    if sTexture then
                        shape.overrideMeshSubsetMaterialEffectMap0 ( hObject, i, sTexture, shape.kMapTypeTexture )
                    end
                    if this.HighlightState (  ) == true then
                        this.HighLightObject (  )
                    end
                end
            end
        end
    end
    
    --Set all sensor categories.
    --
    local nType
    local nNumberOfChildren = object.getChildCount ( hObject )

    for i = 0, nNumberOfChildren -1 do    

        local hChild = object.getChildAt ( hObject, i )
        shape.setMeshMaterial ( hChild, "white" )
        local bHasSensor = object.isKindOf ( hObject, object.kTypeSensor )
        
        if bHasSensor == true then
            sensor.setCategoryBitAt ( hObject,0, 4, true )
        else
            for i = 0, nNumberOfChildren - 1 do

                hChild = object.getChildAt ( hObject, i )
                if hChild ~= nil then 

                    shape.setMeshMaterial ( hChild, "white" )

                    bHasSensor = object.isKindOf ( hChild, object.kTypeSensor )
                    if bHasSensor == true then
                        sensor.setCategoryBitAt ( hChild, 0, 4, true )
                    else
                        nNumberOfChildren = object.getChildCount( hChild )
                        for u = 0, nNumberOfChildren - 1 do
                            local hChild2 = object.getChildAt ( hChild, u )
                            if hChild2 ~= nil then
                                bHasSensor = object.isKindOf ( hChild2, object.kTypeSensor )
                                shape.setMeshMaterial ( hChild2, "white" )
                                if bHasSensor == true then
                                    sensor.setCategoryBitAt ( hChild2, 0, 4, true )
                                end
                            end
                        end
                    end
                end    
            end
        end    
    end
        
    this.sCurrentMaterial_1 ( )
    this.bListSelection ( false )
    this.TargetIsVisible ( false )
    this.Idle ( )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
