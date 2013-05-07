--------------------------------------------------------------------------------
--  Function......... : SetModel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.SetModel ( nState, hParent, nPointX  )
--------------------------------------------------------------------------------
    local hScene = application.getCurrentUserScene ( )
    local hUser = this.getUser ( )
    local hTarget = scene.getTaggedObject ( application.getCurrentUserScene ( ), "target" )
    
    local nTx, nTy, nTz = object.getTranslation ( hTarget, object.kGlobalSpace )
    
    
    --Get room dimensions.
    --
    local hFloor = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Floor" )
    local x1, y1, z1 = object.getBoundingBoxMin ( hFloor )
    local x2, y2, z2 = object.getBoundingBoxMax ( hFloor )
    
    local x3, y3, z3 = object.getBoundingBoxMin ( this.hNewObject() )
    local x4, y4, z4 = object.getBoundingBoxMax ( this.hNewObject() )
    
    local nObjOffset = ( x4 - x3 ) / 2
    local nObjOffsetZ = ( z4 - z3 ) / 2
    local hNewObj = this.hNewObject( )
    
    
    --get obj dimension
    log. message( "SetObject, nState = ", nState )
    
    if nState == 1 then
    
        log.message( "NewObject on wall Right: ", this.hNewObject() )
    
        local bIsCorner = string.compare ( object.getModelName (  this.hNewObject ( ) ), "3371520" )
        log.message ( "String compare returned: ", bIsCorner )
        local sName = object.getModelName( this.hNewObject() )
        local bIsCorner = string.compare ( sName, "3371520" )

                if bIsCorner == 0 then
               
                    if nPointX > 0 then
                    
                    --left corner
                    object.setTranslation ( this.hNewObject ( ), x2 - nObjOffset + 1 , 0, nTz , object.kGlobalSpace )
                  
                    elseif nPointX <= 0 then
                        object.setTranslation ( this.hNewObject ( ), nTx- nObjOffsetZ + 1 , 0, nTz , object.kGlobalSpace )
                        object.setRotation( this.hNewObject(), 0, 0,0,object.kGlobalSpace )

                    
                    --object.matchRotation ( this.hNewObject ( ), hTarget, object.kGlobalSpace )
                    --object.setRotation ( this.hNewObject ( ), 0, 90, 0 ,object.kGlobalSpace )
                    
                    --object.setTranslation ( this.hNewObject ( ), x1 + nObjOffsetZ - 1, 0, nTz + 5.5, object.kGlobalSpace )
                    end
                else
                
                object.setTranslation ( this.hNewObject ( ), nTx, 0, nTz + 2.5, object.kGlobalSpace )
                --Show object
                --
                end

        
        object.setTranslation ( this.hNewObject ( ), nTx- nObjOffsetZ + 2 , 0, nTz , object.kGlobalSpace )
        object.setRotation( this.hNewObject(), 0, -90,0,object.kGlobalSpace )

        --Show object
        --
        object.setVisible ( this.hNewObject ( ), true )
        
        --update cursor state
        --
        user.setAIVariable ( this.getUser ( ), "CursorController", "CursorState", 0 )
        
        
    
    elseif nState == 2 then
    
        log.message( "NewObject: ", this.hNewObject() )
        
        log.message( object.getModelName( this.hNewObject( ) )  )
        local sName = object.getModelName( this.hNewObject() )
        
        local bIsCorner = string.compare ( sName, "3371520" )
        
        log.message ( "String compare returned: ", bIsCorner )
        
                if bIsCorner == 0 then
                
                    if nPointX > 0 then
                    
                    --left corner
                    object.setTranslation ( this.hNewObject ( ), x2 - nObjOffset + 1 , 0, nTz + 5.5, object.kGlobalSpace )
                  
                    elseif nPointX <= 0 then
                    
                    --object.matchRotation ( this.hNewObject ( ), hTarget, object.kGlobalSpace )
                    object.setRotation ( this.hNewObject ( ), 0, 90, 0 ,object.kGlobalSpace )
                    object.setTranslation ( this.hNewObject ( ), x1 + nObjOffsetZ - 1, 0, nTz + 5.5, object.kGlobalSpace )
                    end
                else
                
                object.setTranslation ( this.hNewObject ( ), nTx, 0, nTz + 2.5, object.kGlobalSpace )
                --Show object
                --
                end
                
                object.setVisible ( this.hNewObject ( ), true )
                
                --update cursor state
                --
                user.setAIVariable ( this.getUser ( ), "CursorController", "CursorState", 0 )
        
        
        
    elseif nState == 3 then
    
        log.message( "Place object on right wall" )
    elseif nState == 4 then
    
    log.message ( "Place object in  cabinet" )
    
    --Get parent trans data.
    --
    
    log.message("Got topnode ", hParent )
    
    --object.setParent( this.hNewObject ( ), hParent, false )
    local xP, yP, zP = object.getTranslation( hParent, object.kGlobalSpace )
    local xB, yB, zB = object.getBoundingSphereCenter ( hParent )
    local xMin, yMin, zMin = object.getBoundingBoxMin ( hParent )
    local xMax, yMax, zMax = object.getBoundingBoxMax ( hParent )
    
     local xParentObj = xMin + ( xMax - xMin ) / 2
     local yParentObj = yMin + ( yMax - yMin ) / 2
     local zParentObj = zMin + ( zMax - zMin ) / 2
    
    
    
--     log.message("ParentTranslation = ", xP," ", yP, " ", zP )
--     log.message( "Boundingspherecenter= ", xB," ", yB, " ", zB )
--     log.message("Parent Bounding min = ", xMin," ", yMin, " ", zMin )
--     log.message("Parent Bounding Max = ", xMax," ", yMax, " ", zMax )
--     log.message ( "X result = ", xParentObj )
--     log.message( "Z result = ", zParentObj )
-- 

    --Get dummy object
    --
    --local hDummy = scene.getTaggedObject ( hScene, "ContentDummy" )    
    local xObj, yObj, zObj = object.getTranslation( hNewObj, object.kGlobalSpace )
    local xBObj, yBObj, zBObj = object.getBoundingSphereCenter ( hNewObj )
    local xMinObj, yMinObj, zMinObj = object.getBoundingBoxMin ( hNewObj )
    local xMaxObj, yMaxObj, zMaxObj = object.getBoundingBoxMax ( hNewObj )

--local xD, yD, zD = object.getTranslation( hDummy, object.kGlobalSpace )
--     
    --object.matchTranslation ( hNewObj, hDummy, object.kGlobalSpace )
    object.setTranslation ( this.hNewObject ( ), xParentObj, nTy, zParentObj , object.kGlobalSpace )
    object.setVisible ( this.hNewObject ( ), true )
    object.setParent ( hNewObj, hParent, true  )
    
    --Get object scale.
    --
    
    elseif nState == 5 then
    
        this.DestroyObject (  )

    end 
    --Uppate xml and db.
    --
    local sTag = scene.getObjectTag ( hScene, this.hNewObject ( ) )
    user.sendEvent ( hUser,  "DesignerPlugin_Main", "onAddArticle", sTag, this.sAddedArticle ( ) ) 
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
