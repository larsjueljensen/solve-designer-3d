--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollisionBegin
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.onSensorCollisionBegin ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
	
    if ( this.isMovable ( hTargetObject ) ) then
    
        local hTargetWardrobe = this.getWardrobeObject ( hTargetObject )

        if ( this.objectDirectionIsEqual ( this.getObject ( ), hTargetWardrobe ) ) then
        
            object.setParent ( hTargetWardrobe, this.getObject ( ), true )
            local newWidth = this.objectWidth ( ) + this.getTargetWidth ( hTargetObject )
            this.objectWidth ( newWidth )
            
        end
        
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
