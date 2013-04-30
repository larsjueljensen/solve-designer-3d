--------------------------------------------------------------------------------
--  Function......... : CloseReport
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.CloseReport ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
	local tObjects = user.getAIVariable ( this.getUser ( ), "MovingObject", "tObjectGroup" )
    local hList = hud.getComponent ( hUser, "DialogsHUD.SceneObjects" )
    
    hud.removeListAllItems ( hList )
    
   -- return 1
    

    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
