--------------------------------------------------------------------------------
--  Handler.......... : onLockObjectClicked
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onLockObjectClicked (  )
--------------------------------------------------------------------------------

    local bObjectState = this.UpdateLock ( )    
    
    if this.hSelectedObject ( ) ~= nil then
        
        local sModelTag = scene.getObjectTag ( application.getCurrentUserScene ( ), this.hSelectedObject ( ) )

        local bObjectState = hashtable.get ( this.htLock ( ), sModelTag )
        
         if bObjectState == 0 then --Lock object

            hashtable.set ( this.htLock( ) , sModelTag, 1 )                
            sensor.setCategoryBitAt ( this.hSelectedObject ( ), 0, 1, true )-- Bit nr 1(not 0 ) set to true means no translation adjustment on moving object
            this.UpdateLock ( )
            
        --Set Icon Color
        elseif bObjectState == 1 then --Open object
            hashtable.set ( this.htLock( ), sModelTag, 0 )
        
            sensor.setCategoryBitAt ( this.hSelectedObject ( ), 0, 1, false )-- Bit nr 1(not 0 ) set to flase means full translation adjustment on moving object
            this.UpdateLock ( )
        end
    end


--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
