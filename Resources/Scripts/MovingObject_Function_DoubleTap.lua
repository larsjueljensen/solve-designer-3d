--------------------------------------------------------------------------------
--  Function......... : DoubleTap
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.DoubleTap ( )
--------------------------------------------------------------------------------
	--Declare constants
    local nOpacity = 0
    
  
    local hUser = application.getCurrentUser ( )
    local hToolWnd = hud.getComponent ( hUser, "HUD_sidemenu.Tools" )
    local hRoomEdit = hud.getComponent ( hUser, "HUD_sidemenu.RoomEditor" )
    local hObjectEdit = hud.getComponent ( hUser, "HUD_sidemenu.ObjectEditor" )
    local hSlider = hud.getComponent ( hUser, "Slider" )
    
    log.message ( "DoubleTap last object: ", this.hLastObject ( ))
    this.hSelectedObject ( this.hLastObject ( ) )
    log.message ( "DoubleTap selected object : ", this.hSelectedObject ( ))
    
    if this.hSelectedObject ( ) ~= nil then
    local o = shape.getMeshOpacity ( this.hSelectedObject ( ) )
    this.nObjectOpacity ( o )
    
    --Open material picker
    
    --
    end
    
   
    
  
    
    
    
    local hLast = this.hLastObject ( )
    local hPrevious = this.hPreviousObject ( )
    local hSelected = this.hSelectedObject ( )
    
    this.hRoomObject ( hLast )
    
    --Get main node
    if hLast~= nil then
    local hMainNode = object.getParent ( hLast )
    --hud.callAction (  hUser, "Slider.ShowLowermenu_0" )
    else 
    end
    
--     log.message ( "hLast = ", hLast )
--     log.message ( "hPrevious = ", hPrevious )
--     log.message ( "hSelected = ",  hSelected )
    
    --user.sendEvent ( hUser, "Slider", "onSetTargetObject", hSelected )
    log.message ( "Setting target object value: ", hSelected )
    
    --turn of highlight on previous model
        if hPrevious  then
        
        --shape.overrideMeshMaterialAmbient ( hPrevious,0.3, 0.3, 0.3, 1 )
       --shape.setMeshOpacity ( hPrevious, 1 )
       
       log.message ( "Got handle to previous object: ", hPrevious)

        else
        
        log.message ( "First selection" )
        
        end
    
    --hud.setComponentVisible ( hTools, true )
    --hud.callAction ( hUser, "HUD_sidemenu.ShowToolsWindow" )
    --hud.callAction ( hUser, "MoveObjectHUD.ModulesWndHide" )
   -- hud.callAction ( hUser, "HUD_sidemenu.HideMenuHolder" )
    
    log.message ( "selection: ", this.hLastObject() )
        if this.hLastObject ( ) ~= nil  then
        local nTypeIsRoom = sensor.getCategoryBitAt ( this.hUnderCursorObject ( ), 0, 1 ) 
        local nTypeIsWall = sensor.getCategoryBitAt ( this.hUnderCursorObject ( ), 0, 2 ) 
         
            
            if nTypeIsRoom == true then --Work on Room elements
            
                

            
                log.message ( "Room editor selected" )
                hud.setComponentVisible ( hRoomEdit, true )
                hud.setComponentVisible ( hObjectEdit, false )
                
                user.sendEvent( hUser, "aspmenu_AI", "onRefresh" )
                
                --Check if hit object is wall or floor
                if nTypeIsWall == true then --object is type wall

                    user.sendEvent( hUser, "ASPMain", "onAttributeSelected", 2 )                    
                    --hud.callAction ( hUser, "MoveObjectHUD.ModulesWndHide" ) 
                    this.HighlightSelection ( )
                    --object.sendEvent ( hSelected, "Slider", "onSetTargetObject", hSelected )
                    --user.sendEvent( hUser, "Slider", "onSetTargetObject", hSelected )
                              
                else                         --object is type floor
                    
                    user.sendEvent( hUser, "ASPMain", "onAttributeSelected", 3 )
                
                end
                
            this.hSelectedObject ( this.hLastObject ( ) ) 
            

                
            
            else --Work on Object
               
                --hud.setComponentVisible ( hRoomEdit, false )
                --hud.setComponentVisible ( hObjectEdit, true )

                this.hSelectedObject ( this.hLastObject ( ) )

                --hud.callAction ( hUser, "MoveObjectHUD.ModulesWndHide" )

                log.message ( "Object editor selected for mod: ", this.hSelectedObject ( ) )
                --object.sendEvent ( hNewSlider, "Slider", "onSetTargetObject", hObj )

                --shape.setMeshOpacity ( this.hSelectedObject ( ), nOpacity )
                --user.sendEvent( hUser, "ASPMain", "onAttributeSelected", 1 )

                
                this.HighLightObject ( )
                
                log.message ( "Highlight selected for mod: ", this.hSelectedObject ( ) )
            
            end
            
             
            
            else
            -- do stuff
        end
    

    this.hLastObject( nil )
    
    --Update ASPMain member varible
    

    local hLast = this.hLastObject ( )
    local hPrevious = this.hPreviousObject ( )
    local hSelected = this.hSelectedObject ( )

    log.message ( "hLast = ", hLast )
    log.message ( "hPrevious = ", hPrevious )
    log.message ( "hSelected = ",  hSelected )
    
    user.setAIVariable ( hUser, "ASPMain", "hCurrentObject", this.hSelectedObject ( ) ) 

    
    local hPrevious = this.hSelectedObject ( )
    this.hPreviousObject( hPrevious )
    this.UpdateStatus( this.hSelectedObject ( ), hUser )
    this.UpdateLock ( )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
