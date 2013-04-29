--------------------------------------------------------------------------------
--  Function......... : AddMain
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.AddMain ( hComponent, nHeightPos)
--------------------------------------------------------------------------------
	
		---local hChildren = hud.getChildCount ( hComponent )
    local hScene = application.getCurrentUserScene ( )
    
    
    log.message ( "In addpart: ", hComponent )
    local sSelection = this.nModelID ( )
    local nChildren = object.getChildCount ( hComponent )
    log.message ( "In addpart: ", sSelection )
    --Check if parent has model.
    --
    
    
    for i = 0, nChildren - 1 do
    
    --get child modelname
    local hChild = object.getChildAt ( hComponent, i )
    local sName = object.getModelName ( hChild )
    
    log.message ( "Child Model: ", hChild, "  ", sName )
    
    
    
    if string.compare ( sSelection, sName ) == 0 then
        --Object contains childtemplate.
        --Add part.
        
        if this.bListSelection ( ) == true then
        
        local hNewObject = scene.createRuntimeObject ( hScene, sName )
        local sTag = scene.setObjectTag ( hScene, hChild, sName..i )
        --local bSensor = sensor.getCategoryBitAt ( hChild, 0, 3  )
        this.bListSelection ( false )
        local nTmplX, nTmplY, nTmplZ = object.getTranslation ( hChild , object.kGlobalSpace )
        
        log.message ( "x,y,z: ", nTmplX, "  ", nTmplY, "  ", nTmplZ)
        --object.matchTranslation ( hNewObject, hChild, object.kGlobalSpace )
        
        object.setTranslation ( hNewObject, nTmplX, nHeightPos, nTmplY, object.kGlobalSpace )
        
        else
        end
    end
    
    end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
