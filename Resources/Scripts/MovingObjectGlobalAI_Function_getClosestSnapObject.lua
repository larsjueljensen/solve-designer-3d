--------------------------------------------------------------------------------
--  Function......... : getClosestSnapObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.getClosestSnapObject ( x, y, z, space )
--------------------------------------------------------------------------------

    -- If there are snap objects nearby (detected by collision)
    if not hashtable.isEmpty ( this.htSnapObjects ( ) ) then

        local size = hashtable.getSize ( this.htSnapObjects ( ) )
        
        if ( size <= 1 ) then
            return hashtable.getAt ( this.htSnapObjects ( ), 0 )
        end
                
        local hClosestSnapObject = hashtable.getAt ( this.htSnapObjects ( ), 0 )

        for i = 1, size - 1 do
            hClosestSnapObject = this.getClosestObject ( hClosestSnapObject, hashtable.getAt ( this.htSnapObjects ( ), i ), x, y, z, space )
        end
        
        return hClosestSnapObject
    end
    
    return nil
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
