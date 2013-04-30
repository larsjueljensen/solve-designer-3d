--------------------------------------------------------------------------------
--  Function......... : addSesnsors
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.addSensors ( )
--------------------------------------------------------------------------------
	
	log.message ( "MovingObject.addSensors" )
    
--sensor.add ( hObjectShape, sensor.kShapeTypeBox ) --hObjectShape must be a shape 
--calculate the sensor offset and scale in function of boundingbox and object scale 
-- local cx, cy, cz = object.getBoundingSphereCenter ( hObjectShape )
-- local x1, y1, z1 = object.getBoundingBoxMin ( hObjectShape )
-- local x2, y2, z2 = object.getBoundingBoxMax ( hObjectShape )
-- local scx, scy, scz = object.getScale( hObjectShape ) 
-- local sx = math.abs ( x2-x1 )
-- local sy = math.abs ( y2-y1 )
-- local sz = math.abs ( z2-z1 ) -- set sensor size and offset 
-- sensor.setBoxCenterAt ( hObjectShape, 0, cx, cy, cz, object.kGlobalSpace )
-- sensor.setBoxSizeAt ( hObjectShape, 0, sx/scx, sy/scy, sz/scz ) -- set sensor id 
-- sensor.setIDAt ( hObjectShape, 0, 2 )   
-- 
--object.addAIModel ( hObjectShape, "ObjectAI" )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
