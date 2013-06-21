--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollisionBegin
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.onSensorCollisionBegin ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------

    if not this.isMoving ( hTargetObject ) then
        local hSnapObject = this.getWardrobeObject ( hTargetObject )
        hashtable.add ( this.htSnapObjects ( ), scene.getObjectTag ( application.getCurrentUserScene ( ), hSnapObject ), hSnapObject )
    end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
