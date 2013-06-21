--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollisionEnd
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.onSensorCollisionEnd ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
		
    if not this.isMoving ( hTargetObject ) then
        local hSnapObject = this.getWardrobeObject ( hTargetObject )
        hashtable.remove ( this.htSnapObjects ( ), scene.getObjectTag ( application.getCurrentUserScene ( ), hSnapObject ) )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
