--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onInit (  )
--------------------------------------------------------------------------------
	
	--application.setCurrentUserScene ( "MovingObject" )
    local hUser = application.getCurrentUser ( )
    
--     if  hUser  then 
--      hud.newTemplateInstance ( hUser, "MoveObjectHUD", "MoveObjectHUD" )
-- 	else end
-- 
local nNaviState = user.getAIVariable ( hUser, "ASPMain", "ASPMain.nControlMode" )
log.message ( "local nNaviState = user.getAIVariable ( hUser", nNaviState )

this.nControlMode ( nNaviState )

    local uid = application.getUniqueIdentifier ( )
   
   log.message ( "uid : ", uid )
   
   this.nUID( uid )

------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
