--------------------------------------------------------------------------------
--  Handler.......... : onLockObjectClicked
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onLockObjectClicked (  )
--------------------------------------------------------------------------------
	
    --Checkbutton state
    
    local bObjectState = this.UpdateLock ( )
    log.message ( "Lock object. State = ", bObjectState )
    
    --TODO: Highlight button On/off
    
    
    
    
    
    
    --Get object lockstate from hash entry.
    log.message ( "Lock object.", this.hSelectedObject ( ) )
    
    
    
if this.hSelectedObject ( ) ~= nil then
    
    local sModelTag = scene.getObjectTag ( application.getCurrentUserScene ( ), this.hSelectedObject ( ) )
    log.message ( "Lock object. Model = ", sModelTag )

    local bObjectState = hashtable.get ( this.htLock ( ), sModelTag )
    
     if bObjectState == 0 then --Lock object
            --set state to locked in hashtable.
            hashtable.set ( this.htLock( ) , sModelTag, 1 )
            
             sensor.setCategoryBitAt ( this.hSelectedObject ( ), 0, 1, true )-- Bit nr 1(not 0 ) set to true means no translation adjustment on moving object
   this.UpdateLock ( )
            
            --Set Icon Color
    elseif bObjectState == 1 then--Open object
            hashtable.set ( this.htLock( ), sModelTag, 0 )
    
        sensor.setCategoryBitAt ( this.hSelectedObject ( ), 0, 1, false )-- Bit nr 1(not 0 ) set to flase means full translation adjustment on moving object
this.UpdateLock ( )
    end
    
	--Get handle to Object
    this.hSelectedObject ( )
    
    --set CategoryBit

else
--do nada

end


--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
