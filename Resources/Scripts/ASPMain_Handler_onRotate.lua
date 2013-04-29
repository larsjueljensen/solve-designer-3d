--------------------------------------------------------------------------------
--  Handler.......... : onRotate
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onRotate (  )
--------------------------------------------------------------------------------
	local hUser = application.getCurrentUser ( )
	this.nControlMode ( 0 )
    user.setAIVariable ( hUser, "MovingObject", "nControlMode", 0  )
    
    local hScene = application.getCurrentUserScene ( )
    local hNav = scene.getTaggedObject ( hScene, "Group_" )
    
    if hNav then
    local hObject = object.getChildAt ( hNav, 0 )    
    local hObject2 = object.getChildAt ( hNav, 1 )    
        if hObject ~= nil  then
    
        log.message ( "Got hObject" )
            if ( object.isVisible ( hObject ) )then
            
            object.setVisible ( hObject, false )
                    
            else
            object.setVisible ( hObject, true )
            --object.setVisible ( hObject2, false )
            
            end
        else
        end

    
    log.message ( "onRotate: ", hObject )
    log.message  ( "Is visible: ", object.isVisible ( hObject )  )
    
    local hObject2 = object.getChildAt ( hNav, 1 )
    else
    end
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
