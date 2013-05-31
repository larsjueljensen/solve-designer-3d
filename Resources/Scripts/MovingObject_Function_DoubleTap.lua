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
    
    this.hSelectedObject ( this.hLastObject ( ) )
    
    if this.hSelectedObject ( ) ~= nil then
        local o = shape.getMeshOpacity ( this.hSelectedObject ( ) )
        this.nObjectOpacity ( o )
    end
    
    local hLast = this.hLastObject ( )
    local hPrevious = this.hPreviousObject ( )
    local hSelected = this.hSelectedObject ( )
    
    this.hRoomObject ( hLast )
    
    if hLast~= nil then
        local hMainNode = object.getParent ( hLast )
    end
    
    if this.hLastObject ( ) ~= nil  then
        local nTypeIsRoom = sensor.getCategoryBitAt ( this.hUnderCursorObject ( ), 0, 1 ) 
        local nTypeIsWall = sensor.getCategoryBitAt ( this.hUnderCursorObject ( ), 0, 2 ) 
         
            
        if nTypeIsRoom == true then --Work on Room elements
            
            hud.setComponentVisible ( hRoomEdit, true )
            hud.setComponentVisible ( hObjectEdit, false )
            
            user.sendEvent( hUser, "aspmenu_AI", "onRefresh" )
            
            --Check if hit object is wall or floor
            if nTypeIsWall == true then --object is type wall

                user.sendEvent( hUser, "ASPMain", "onAttributeSelected", 2 )
                this.HighlightSelection ( )
            else                         --object is type floor
                user.sendEvent( hUser, "ASPMain", "onAttributeSelected", 3 )
            end
            
            this.hSelectedObject ( this.hLastObject ( ) ) 
            
        else --Work on Object
        
            this.hSelectedObject ( this.hLastObject ( ) )
            this.HighLightObject ( )
            
        end
    end

    this.hLastObject( nil )
    
    --Update ASPMain member varible
    

    local hLast = this.hLastObject ( )
    local hPrevious = this.hPreviousObject ( )
    local hSelected = this.hSelectedObject ( )
    
    user.setAIVariable ( hUser, "ASPMain", "hCurrentObject", this.hSelectedObject ( ) ) 

    local hPrevious = this.hSelectedObject ( )
    this.hPreviousObject( hPrevious )
    this.UpdateStatus( this.hSelectedObject ( ), hUser )
    this.UpdateLock ( )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
