--------------------------------------------------------------------------------
--  Function......... : setDragObjectSensorMaskBits
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.setDragObjectSensorMaskBits ( hObject )
--------------------------------------------------------------------------------

    if ( sensor.getCount ( hObject ) > 0 ) then
        sensor.setActiveAt ( hObject, 0, true )
        sensor.setCategoryBitAt ( hObject, 0, this.kSensorCategoryBitMovable ( ), true )
        sensor.setMaskBitAt ( hObject, 0, this.kSensorCategoryBitMovable ( ), true )
        sensor.setIDAt ( hObject, 0, this.kSensorCategoryBitMovable ( ) )
    end

    for i = 0, object.getChildCount ( hObject ) - 1 do
        this.setDragObjectSensorMaskBits ( object.getChildAt ( hObject, i ) )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
