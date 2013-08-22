--------------------------------------------------------------------------------
--  Function......... : setDragObjectSensorMaskBits
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.setDragObjectSensorMaskBits ( hObject )
--------------------------------------------------------------------------------

    local sensorCategoryBit = this.kSensorMovable ( )

    if ( sensor.getCount ( hObject ) > 0 ) then
        sensor.setActiveAt ( hObject, 0, true )
        sensor.setCategoryBitAt ( hObject, 0, sensorCategoryBit, true )
        sensor.setMaskBitAt ( hObject, 0, sensorCategoryBit, true )
        sensor.setIDAt ( hObject, 0, sensorCategoryBit )
    end

    for i = 0, object.getChildCount ( hObject ) - 1 do
        this.setDragObjectSensorMaskBits ( object.getChildAt ( hObject, i ) )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
