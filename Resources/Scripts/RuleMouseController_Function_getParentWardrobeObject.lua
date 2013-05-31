--------------------------------------------------------------------------------
--  Function......... : getParentWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function RuleMouseController.getParentWardrobeObject ( hObject )
--------------------------------------------------------------------------------

    local hParentObject = hObject
	
    while ( hParentObject ~= nil ) do
        
        if ( this.isWardrobeObject( hParentObject ) ) then
        
            return hParentObject
        
        end
        
        hParentObject = object.getParent ( hParentObject )
      
    end
    
    return nil
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
