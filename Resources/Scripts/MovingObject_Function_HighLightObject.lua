--------------------------------------------------------------------------------
--  Function......... : HighLightObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.HighLightObject ( )
--------------------------------------------------------------------------------
    local hScene = application.getCurrentUserScene ( )
    local hPrevious = this.hPreviousObject ( ) 
    
    local nLevel = this.nSelectionLevel ( )
    
    log.message( "Enter fnc: selection level = ", this.nSelectionLevel( ) )
    
    log.message ( "Object highlight", this.hSelectedObject ( ) )
        
    local hObject =  this.hSelectedObject ( ) 
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
