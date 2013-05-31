--------------------------------------------------------------------------------
--  Function......... : RotateStep
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.RotateStep ( nDir )
--------------------------------------------------------------------------------
	
	local hObject = this.hSelectedObject ( )
    local nAngle = this.nStepAngle ( )
    
    if hObject then
    
        local nObjRotX, nObjRotY, nObjRotZ = object.getRotation ( hObject, object.kGlobalSpace )
    
        if nDir == 0 then
            object.setRotation ( hObject,  0, -nAngle, 0, object.kLocalSpace )
        elseif nDir == 1 then
            object.setRotation ( hObject,  0, nAngle, 0, object.kLocalSpace )
        end
	end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
