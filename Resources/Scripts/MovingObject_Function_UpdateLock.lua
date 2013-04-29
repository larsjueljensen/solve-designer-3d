--------------------------------------------------------------------------------
--  Function......... : UpdateLock
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.UpdateLock ( )
--------------------------------------------------------------------------------
	


--Get State

if this.hSelectedObject ( ) ~= nil
then

local bState = hashtable.get( this.htLock ( ), scene.getObjectTag ( application.getCurrentUserScene ( ), this.hSelectedObject ( ) ))
local hIcon = hud.getComponent ( application.getCurrentUser ( ), "controls.Lock_Btn" )


if bState == 0 then--Object is open

log.message ( "Object is Open" )

--hud.setComponentBackgroundImage ( hIcon,"Padlock2"  )


elseif bState == 1 then --Object is locked.

log.message ( "Object is Locked" )

--hud.setComponentBackgroundImage ( hIcon,"Padlock1"  )

end

log.message ( "UpdateLock, bState = ", bState )


return bState	

end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
