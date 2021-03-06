--------------------------------------------------------------------------------
--  Function......... : GetTopNode
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller_old.GetTopNode ( hHitObject)
--------------------------------------------------------------------------------
	
    log.message ( "Received hHitObject: ", hHitObject )
        
    local hUser = this.getUser ( )
    
    local i --level in hierarchy
    
    local bHasParent = false
    
    local hObject = hHitObject
    
    
    if hObject then
    local hParent = object.getParent ( hObject )

        if hParent then
        bHasParent = true
        end
            while ( bHasParent == true ) 
            do
            
            hParent = object.getParent ( hObject )
            
                    if hParent ~= nil 
                    then
                    log.message ( "Found parent object: ", hParent )
                    hObject = hParent
                    else
                    bHasParent = false
                    end
            
            
            end
        
        return hObject
    end
        
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
