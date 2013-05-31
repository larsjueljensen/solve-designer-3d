--------------------------------------------------------------------------------
--  Function......... : transferAIVariable
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.transferAIVariable ( hObject, aiModel, hOtherObject, aiOtherModel, sVariable )
--------------------------------------------------------------------------------
	
    local vValue = object.getAIVariable ( hOtherObject, aiOtherModel, sVariable )
    object.setAIVariable ( hObject, aiModel, sVariable, vValue )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
