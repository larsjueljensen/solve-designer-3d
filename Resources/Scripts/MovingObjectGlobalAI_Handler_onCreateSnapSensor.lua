--------------------------------------------------------------------------------
--  Handler.......... : onCreateSnapSensor
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.onCreateSnapSensor (  )
--------------------------------------------------------------------------------

    local hObject = this.getObject ( )
    local minx, miny, minz, maxx, maxy, maxz = this.getBoundingBox ( hObject )
    local sx, sy, sz = maxx - minx, maxy - miny, maxz - minz
    local x, y, z = minx + 0.5 * sx, miny + 0.5 * sy, minz + 0.5 * sz

    sensor.add ( hObject, sensor.kShapeTypeBox )
    sensor.setCategoryBitAt ( hObject, 0, 0, false )
    sensor.setCategoryBitAt ( hObject, 0, 3, true )
    sensor.setMaskBitAt ( hObject, 0, 0, false )
    sensor.setMaskBitAt ( hObject, 0, 3, true )
    sensor.setActiveAt ( hObject, 0, true )
    sensor.setBoxCenterAt ( hObject, 0, x, y, z, object.kGlobalSpace )
    sensor.setBoxSizeAt ( hObject, 0, this.objectWidth ( ) + 2, this.objectHeight ( ) + 2, this.objectDepth ( ) + 2 )


--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
