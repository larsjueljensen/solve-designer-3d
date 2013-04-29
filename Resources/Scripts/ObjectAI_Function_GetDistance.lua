--------------------------------------------------------------------------------
--  Function......... : GetDistance
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.GetDistance ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser()
    local hScene = application.getCurrentUserScene ( )
    local bState = this.bIsMovingObject ( )
    local hNewObject = user.getAIVariable ( hUser ,"MovingObject", "hMovingObject")
    
    local hCursorX = user.getAIVariable ( hUser ,"MovingObject", "nOffsetX")
    local sTargetTag = scene.getObjectTag ( hScene, this.hTargetObject( ) )
    local hObj = this.getObject ( )
    object.getDistanceToObject (  )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
