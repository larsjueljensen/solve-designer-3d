--------------------------------------------------------------------------------
--  Handler.......... : onSensorCollisionBegin
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingCollisionAI.onSensorCollisionBegin ( nSensorID, hTargetObject, nTargetSensorID )
--------------------------------------------------------------------------------
	
    if ( this.isMovable ( hTargetObject ) ) then
    
        if ( this.isParentMovingObject ( this.getObject ( ) ) ) then

            local hTargetWardrobe = this.getTopMostWardrobeObject ( hTargetObject )
        
            if ( this.objectDirectionIsEqual ( this.getObject ( ), hTargetWardrobe ) ) then

                log.message ( "MovingCollisionAI - onSensorCollisionBegin - Getting there" )
                object.setParent ( hTargetWardrobe, object.getParent ( this.getObject ( ) ), true )

--                 local newWidth = this.objectWidth ( ) + this.getTargetWidth ( hTargetObject )
--                 this.objectWidth ( newWidth )
                
            end
        end

        
    end    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
