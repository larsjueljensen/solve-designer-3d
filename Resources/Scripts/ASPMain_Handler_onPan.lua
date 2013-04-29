--------------------------------------------------------------------------------
--  Handler.......... : onPan
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onPan (  )
--------------------------------------------------------------------------------
	
	this.nControlMode ( 2 )
    
    --Update NAV Icon
    
    --local sTag = scene.getObjectT ( application.getCurrentUserScene( ), scene.getTaggedObject (  ) )
    
    local hScene = application.getCurrentUserScene ( )
    local hNav = scene.getTaggedObject ( hScene, "Group_" )
    
    if hNav then
    local hObject = object.getChildAt ( hNav, 0 )
    local hObject2 = object.getChildAt ( hNav, 1 )
        
        if ( object.isVisible ( hObject2 ) )then
        
        else
        object.setVisible ( hObject, false )
        --object.setVisible ( hObject2, true )
    
        end

    else
    end

    
       
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
