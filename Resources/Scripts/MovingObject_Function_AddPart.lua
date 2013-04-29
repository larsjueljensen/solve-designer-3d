--------------------------------------------------------------------------------
--  Function......... : AddPart
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.AddPart ( hComponent, nHeightPos )
--------------------------------------------------------------------------------
	
	---local hChildren = hud.getChildCount ( hComponent )
    local hScene = application.getCurrentUserScene ( )
    
    
    local hParent = object.getParent ( hComponent )
    
    --Set top object
    --
    if hSuperParent then
    
    else
    
    hSuperParent = hParent
    
    end
    
    local hSuperParent = object.getParent ( hParent )
    
    log.message ( "In addpart, hComponent: ", hComponent )
    log.message ( "In addpart, hParent: ", hParent )

    local sSelection = this.nModelID ( )
    
    local nChildren = object.getChildCount ( hSuperParent )
    log.message ( "In addpart, sSelection: ", sSelection )
    --Check if parent has model.
    --
    
    
    for i = 0, nChildren - 1 do
    
    --get child modelname
    local hChild = object.getChildAt ( hSuperParent, i )
    local sName = object.getModelName ( hChild )
    
    log.message ( "Child Model: ", hChild, "  ", sName )
    
    
    
    if string.compare ( sSelection, sName ) == 0 then
        --Object contains childtemplate.
        --Add part.
        
        if this.bListSelection ( ) == true then
        
        local hNewObject = scene.createRuntimeObject ( hScene, sName )
        sensor.add ( hNewObject, sensor.kShapeTypeBox )

        local sTag = scene.setObjectTag ( hScene, hChild, sName..i )
        object.addAIModel ( hNewObject, "ObjectAI" )
        object.setParent ( hNewObject, hSuperParent, true )
        --local bSensor = sensor.getCategoryBitAt ( hChild, 0, 3  )

        local nTmplX, nTmplY, nTmplZ = object.getTranslation ( hChild , object.kGlobalSpace )
        
        log.message ( "x,y,z: ", nTmplX, "  ", nTmplY, "  ", nTmplZ)
        object.matchTranslation ( hNewObject, hChild, object.kGlobalSpace )
        object.matchRotation ( hNewObject, hChild, object.kGlobalSpace )
        object.setTranslation ( hNewObject, nTmplX, nHeightPos, nTmplZ, object.kGlobalSpace )

        this.bListSelection ( false )
        this.TargetIsVisible ( false )
        this.Idle ( )
   
        
        
        
        else
        end
    end
    
    end
    
    

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
