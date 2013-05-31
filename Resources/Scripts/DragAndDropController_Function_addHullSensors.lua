--------------------------------------------------------------------------------
--  Function......... : addHullSensors
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.addHullSensors ( hObject )
--------------------------------------------------------------------------------
	
    local minx, miny, minz = object.getBoundingBoxMin ( hObject )
    local maxx, maxy, maxz = object.getBoundingBoxMax ( hObject )
    
    sensor.add ( hObject, sensor.kShapeTypeBox )
    sensor.setActiveAt ( hObject, 0, true )
    sensor.setBoxCenterAt ( hObject, 0, maxx - minx, maxy - miny, maxz - minz, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hObject, 0, 2, 2, 2 )
    sensor.setCategoryBitAt ( hObject, 0, 3, true )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
