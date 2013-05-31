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
        
            if ( object.isVisible ( hObject ) )then
                object.setVisible ( hObject, false )
            else
                object.setVisible ( hObject, true )
            end
        end
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
