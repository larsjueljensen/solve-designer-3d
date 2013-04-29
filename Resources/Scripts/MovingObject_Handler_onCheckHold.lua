--------------------------------------------------------------------------------
--  Handler.......... : onCheckHold
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onCheckHold ( xStart, yStart )
--------------------------------------------------------------------------------
	
	
    local hUser = application.getCurrentUser ( )
    local x, y = hud.getCursorPosition( hUser )
    local hHUDComponent = hud.getUnderCursorComponent ( hUser ) 
    
    if this.hLastObject ( ) ~= 0 then
       --local sObjectTag = scene.getObjectTag ( application.getCurrentUserScene( ), this.hLastObject ( ) )
    else
    end
    
    log.message ( "xStart: ", xStart )
    log.message ( "yStart: ", yStart )
    log.message ( "X: ", x )
    log.message ( "Y: ", y )
    log.message ( "Var nStartPosX: ", this.nCursorStartX ( ) )
    log.message ( "Var nStartPosY: ", this.nCursorStartY ( ) )
    log.message ( "Var hHUDComponent: ", hHUDComponent )

    
    if this.bMouseDown( ) == true and hHUDComponent == nil then
    
        if x == this.nCursorStartX ( ) and y == this.nCursorStartY ( ) then
        this.hLastObject ( )
        log.message ( "Cursor hold, fnc called" )
        
        
        
        
        --this.sendEvent ( "onPopup", 0 )
        
        
        else
        end
    else
    end
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------