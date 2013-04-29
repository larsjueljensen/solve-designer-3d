--------------------------------------------------------------------------------
--  Function......... : SingleTap
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.SingleTap ( )
--------------------------------------------------------------------------------
    
    local hUser = application.getCurrentUser( )
    log.message ( "SINGLETAP" )
    log.message ( "SingleTap selected object : ", this.hLastObject ( ))
  
    if this.nButtonPressed ( ) == 1 then
            this.sendEvent ( "onPopup", 1 )
            log.message ( "Right click" )
            
    end
    local bMode = user.getAIVariable ( hUser, "ASPMain", "bCamera2DMode" )

    if this.nButtonPressed ( ) == 0 then

        if this.hLastObject ( ) then
            local sTag1 = scene.getObjectTag (application.getCurrentUserScene ( ), this.hLastObject ( ) )
            log.message ( "sTag = ", sTag1 )
            
            if sTag1 == "Plane" or sTag1 == "Floor" then
            --Hit wall or floor
            
            else
             
                local bTopMode = user.getAIVariable ( hUser,"ASPMain", "bTopViewMode" )


                
                log.message ( "bTopMode = ", bTopMode )
                
                if bTopMode == true then
                


                else
                    if bMode == false then
                    
                        --object.sendEvent( application.getCurrentUserActiveCamera ( ), "ASPCamera", "onFocus", this.hLastObject ( ) )
                    
                    elseif bMode == true then
                    
                        --object.sendEvent( application.getCurrentUserActiveCamera ( ), "ASPCamera2D", "onFocus", this.hLastObject ( ) )
                    
                    end
                
                
                
                end
            end
        
        else
        
        end
    end
        
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
