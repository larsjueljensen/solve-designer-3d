--------------------------------------------------------------------------------
--  Function......... : QuantizeY
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.QuantizeY ( )
--------------------------------------------------------------------------------
	
	--get handles
    --
    local hUser = this.getUser ( )
    local hScene = application.getCurrentUserScene ( )
    local hHelper1 = scene.getTaggedObject( hUser, "HelperTop") 
    local hHelper2 = scene.getTaggedObject( hUser, "HelperBottom") 
    
    local nDist = object.getDistanceToObject ( hHelper1, hHelper2 )
    
    local nStepSize = nDist/62
    
    local nX1, nY1, nZ1 = object.getTranslation ( hHelper1, object.kGlobalSpace )
    
    for i = 0, nStepSize - 1
    do
    
    local hStepHelper = scene.createRuntimeObject (  hScene, "StepHelper")
    object.setTranslation ( hStepHelper, nX1, nY1 - nDist, nZ1, object.kGlobalSpace )
    end
    
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
