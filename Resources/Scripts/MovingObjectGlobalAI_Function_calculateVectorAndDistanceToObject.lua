--------------------------------------------------------------------------------
--  Function......... : calculateVectorAndDistanceToObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.calculateVectorAndDistanceToObject ( x, y, z, hObject, space )
--------------------------------------------------------------------------------
	
    -- Get snap object's position
    local sx, sy, sz = object.getTranslation ( hObject, space )
    
    -- Calculate vector between object and wanted position
    local dx, dy, dz = x - sx, y - sy, z - sz
    
    -- Get the distance between the snap object and the wanted position
    local length = math.vectorLength ( dx, dy, dz )
    
    return dx, dy, dz, length
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
