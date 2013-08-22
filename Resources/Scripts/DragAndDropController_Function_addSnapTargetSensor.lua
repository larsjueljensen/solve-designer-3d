--------------------------------------------------------------------------------
--  Function......... : addSnapTargetSensor
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.addSnapTargetSensor ( hObject )
--------------------------------------------------------------------------------
	
    local minx, miny, minz, maxx, maxy, maxz = this.getObjectBounds ( hObject )
    local width, height, depth = maxx - minx, maxy - miny, maxz - minz
    
    sensor.add ( hObject, sensor.kShapeTypeBox )
    sensor.setActiveAt ( hObject, 0, true )
    
    local x, y, z = minx + 0.5 * width, miny + 0.5 * height, minz + 0.5 * depth
    
    sensor.setBoxCenterAt ( hObject, 0, x, y, z, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hObject, 0, width, height, depth )
    sensor.setCategoryBitAt ( hObject, 0, 0, false )
    sensor.setMaskBitAt ( hObject, 0, 0, false )
    sensor.setCategoryBitAt ( hObject, 0, 3, true )
    sensor.setMaskBitAt ( hObject, 0, 3, true )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
