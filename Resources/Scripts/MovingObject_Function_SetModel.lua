--------------------------------------------------------------------------------
--  Function......... : SetModel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.SetModel ( nState, hParent, nPointX  )
--------------------------------------------------------------------------------
    local hScene = application.getCurrentUserScene ( )
    local hNewObj = this.hNewObject( )

    local hUser = this.getUser ( )
    local hTarget = scene.getTaggedObject ( application.getCurrentUserScene ( ), "target" )
    
    local nTx, nTy, nTz = object.getTranslation ( hTarget, object.kGlobalSpace )
        
    local hFloor = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Floor" )
    local x1, y1, z1 = object.getBoundingBoxMin ( hFloor )
    local x2, y2, z2 = object.getBoundingBoxMax ( hFloor )
    
    local x3, y3, z3 = object.getBoundingBoxMin ( hNewObj )
    local x4, y4, z4 = object.getBoundingBoxMax ( hNewObj )
    
    local nObjOffset = ( x4 - x3 ) / 2
    local nObjOffsetZ = ( z4 - z3 ) / 2
    
    if nState == 1 then
    
        local sName = object.getModelName( hNewObj )        
        object.setTranslation ( hNewObj, nTx, 0, nTz + 2.5, object.kGlobalSpace )
        object.setTranslation ( hNewObj, nTx- nObjOffsetZ + 2 , 0, nTz , object.kGlobalSpace )
        object.setRotation( hNewObj, 0, -90,0,object.kGlobalSpace )
        object.setVisible ( hNewObj, true )
        user.setAIVariable ( this.getUser ( ), "CursorController", "CursorState", 0 )
    
    elseif nState == 2 then
    
        local sName = object.getModelName( hNewObj )
        
        object.setTranslation ( hNewObj, nTx, 0, nTz + 2.5, object.kGlobalSpace )
        object.setVisible ( hNewObj, true )
        user.setAIVariable ( this.getUser ( ), "CursorController", "CursorState", 0 )
        
    elseif nState == 4 then
            
        --object.setParent( this.hNewObject ( ), hParent, false )
        local xP, yP, zP = object.getTranslation( hParent, object.kGlobalSpace )
        local xB, yB, zB = object.getBoundingSphereCenter ( hParent )
        local xMin, yMin, zMin = object.getBoundingBoxMin ( hParent )
        local xMax, yMax, zMax = object.getBoundingBoxMax ( hParent )
        
        local xParentObj = xMin + ( xMax - xMin ) / 2
        local yParentObj = yMin + ( yMax - yMin ) / 2
        local zParentObj = zMin + ( zMax - zMin ) / 2
        
        local xObj, yObj, zObj = object.getTranslation( hNewObj, object.kGlobalSpace )
        local xBObj, yBObj, zBObj = object.getBoundingSphereCenter ( hNewObj )
        local xMinObj, yMinObj, zMinObj = object.getBoundingBoxMin ( hNewObj )
        local xMaxObj, yMaxObj, zMaxObj = object.getBoundingBoxMax ( hNewObj )

        object.setTranslation ( hNewObj, xParentObj, nTy, zParentObj , object.kGlobalSpace )
        object.setVisible ( hNewObj, true )
        object.setParent ( hNewObj, hParent, true )
        
    elseif nState == 5 then
        local sRemovedTag = this.DestroyObject ( )
        
        if sRemovedTag == nil then
        else        
            user.sendEvent ( hUser, "DesignerPlugin_Main", "onRemoveArticle", sRemovedTag )
        end
    end
    
    if nState == 5 then
    else
        local sTag = scene.getObjectTag ( hScene, this.hNewObject ( ) )
        object.addAIModel ( hNewObj, "CommonObjectProperties" )
        object.addAIModel ( hNewObj, "Rule01_CornerCabinetFaceCenter" )
        this.setObjectArticleNumber ( hNewObj, this.sAddedArticle ( ) )
        user.sendEvent ( hUser,  "DesignerPlugin_Main", "onAddArticle", sTag, this.sAddedArticle ( ) ) 
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
