--------------------------------------------------------------------------------
--  Function......... : PositionNavIcon
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.PositionNavIcon ( nXo, nYo, nZo )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    
    local hGroup = scene.getTaggedObject ( hScene, "Group_"  )
    local hObject = user.getAIVariable ( hUser, "MovingObject", "hUnderCursorObject" )
    
    
    local hRotate = object.getChildAt ( hGroup, 0 )
    
    local nX, nY, nZ = object.getTranslation ( hObject, object.kGlobalSpace )
    
    local nIconX = this.nSelectedObjectTransX ( )
    local nIconY = 12
    local nIconZ = this.nSelectedObjectTransZ ( )
    
    --object.setTranslation ( hRotate, nXo, nIconY, nZo, object.kGlobalSpace )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
