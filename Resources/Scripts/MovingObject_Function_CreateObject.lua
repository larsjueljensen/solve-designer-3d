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
    
    log.message ("Creating runtimeObject: ", hObject )
    
    --log.message ( "Selection: ", this.sListSelection( )  )
   
    local uid = this.nUID ( )
   
    this.hNewObject ( hObject )
    this.hLastObject ( hObject )
   
    --tempdata

   
    local z = 0
    local x = 0
   
    local nRotation = hashtable.get ( htDefaultRot, this.sListSelection ( ) )
   
   
    --get childcount
   
    local nChildren = object.getChildCount ( hObject )
     
    if hObject then
        local Ox, Oy, Oz = object.getTranslation ( hObject, object.kGlobalSpace )
        object.addAIModel ( hObject, "SliderTarget" )
        local nSceneModelCount  = nSceneModelCount + 1
        this.nSceneModels ( nSceneModelCount )
            --object.addAIModel ( hObject, "ObjectAI" )
            local sTag = uid.."_"..nSceneModelCount
            scene.setRuntimeObjectTag ( hScene, hObject, sTag )
            
            log.message( "sTag = ", sTag )
            
            --Update db.
            
            --Hide object
            object.setVisible ( hObject, false  )
            --Deactivate all sensors.
            --
            object.getChildCount (  hObject )
            table.add ( tObjects, sTag )
            
            --TODO add to ht            
            hashtable.add ( this.htLock ( ), sTag, 0 )
            
            --Record action.
            --
            log.message ( "Recordaction:", sTag, 0  )
            
            
            this.RecordAction ( sTag, 0 )

            
            log.message ( "Added to table index :", nSceneModelCount," ", "Value :", table.getAt ( tObjects, nSceneModelCount-1 ) )
           
            --calculate the sensor offset and scale in function of boundingbox and object scale
            -- 
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
           
           log.message ( "Object has _", nChildren, "_ children" )
           log.message ( "Object has _", nSubsets, "_ subsets" )
                
                if nSubsets == 1 then
                table.insertAt ( hTextures, 3, sTexture )
                else
                    for i = 0, nSubsets - 1 do
                        local hChildPart = object.getChildAt ( hObject, i )
                        table.add ( hTextures, sTexture )
                    end 
                end
                   
            else --Table has existing tetures
                local nSubsets = shape.getMeshSubsetCount ( hObject )
                if nSubsets == 1 then
                    local sTexture = table.getAt ( hTextures, 3 )
                    log.message ( "Got subset texture: ", sTexture )
                        if sTexture then
                        log.message ( this.hHighlightedObject (  ) )
                        
                        end
                            if this.HighlightState (  ) == true then
                            this.HighLightObject (  )
                            else
                            end
                else
                           
                    for i = 0, nSubsets - 1 do
                    local sTexture = table.getAt ( hTextures, i )
                    log.message ( "Got subset texture: ", sTexture )
                        if sTexture then
                        shape.overrideMeshSubsetMaterialEffectMap0 ( hObject, i, sTexture, shape.kMapTypeTexture )
                        log.message ( this.hHighlightedObject (  ) )
                        end
                            if this.HighlightState (  ) == true then
                            this.HighLightObject (  )
                            else
                            end
                    end
                end
            end
    
    local hParent = scene.getTaggedObject ( hScene, "Group_" )
	end
    
    --Set all sensor categories.
    --
    local nType
    local nNumberOfChildren = object.getChildCount ( hObject )
    local hChild
    for i = 0, nNumberOfChildren -1
        do
            local bHasSensor = object.isKindOf ( hObject, object.kTypeSensor )
            log.message ( "bHasSensor: ", bHasSensor )
            if bHasSensor == true 
            then
            sensor.setCategoryBitAt ( hObject,0, 4, true )
            else
            log.message("Object has children: ", nNumberOfChildren )
            for i = 0, nNumberOfChildren - 1
            do
            hChild = object.getChildAt ( hObject, i )
                if hChild ~= nil 
                then
                bHasSensor = object.isKindOf ( hChild, object.kTypeSensor )
                    if bHasSensor == true 
                    then
                        sensor.setCategoryBitAt ( hChild, 0, 4, true )
                    else
                        nNumberOfChildren = object.getChildCount( hChild )
                        log.message("Object has children: ", nNumberOfChildren )
                        for u = 0, nNumberOfChildren - 1
                        do
                        local hChild2 = object.getChildAt ( hChild, u )
                            if hChild2 ~= nil then
                            bHasSensor = object.isKindOf ( hChild2, object.kTypeSensor )
                            
                                if bHasSensor == true 
                                then
                                    sensor.setCategoryBitAt ( hChild2, 0, 4, true )
                                    
                                    --object.addAIModel ( hChild2, "ObjectAI" )
                                else
                                    nNumberOfChildren = object.getChildCount( hChild )
                                end
                            end
                        end
                    end
                end    
            end
        end    
    end
        
    --set default texture or selected texture on modell being loaded

    this.sCurrentMaterial_1 ( )
    this.bListSelection ( false )
    this.TargetIsVisible ( false )
    this.Idle ( )
    
    
    --******************************************************
    
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
