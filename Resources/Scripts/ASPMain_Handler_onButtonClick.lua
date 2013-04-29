--------------------------------------------------------------------------------
--  Handler.......... : onButtonClick
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onButtonClick ( nClick )
--------------------------------------------------------------------------------
	
	log.message ( "User clicked" )
    
    local hButton1 = hud.getComponent ( this.getUser ( ), "main.button1" )
    local hButton2 = hud.getComponent ( this.getUser ( ), "main.button2" )
    local hButton3 = hud.getComponent ( this.getUser ( ), "main.button3" )
     
    local hTag1 = hud.getComponentTag ( hButton1 )
    local hTag2 = hud.getComponentTag ( hButton2 )
    local hTag3 = hud.getComponentTag ( hButton3 )

    local hComponent = hud.getUnderCursorComponent ( this.getUser ( ) )
    
    local hTag0 = hud.getComponentTag ( hComponent )
    
    
    log.message ( "Tags: ", hTag1, "  ", hTag2, "  ", hTag3 )
    log.message ( "Tags: ", hTag0 )
   
    
    if nClick== 0 then
     
     log.message ( "Button 1" )

        log.message ( "Categorystate: ", this.nCategoryState( ) )
    
    elseif nClick== 1 then
     
        log.message ( "Button 2" )

        elseif nClick== 2 then
     
        log.message ( "Button 3" )
   
    
    end
    

     
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
