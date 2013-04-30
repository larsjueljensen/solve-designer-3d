--------------------------------------------------------------------------------
--  Function......... : CreateReceipt
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.CreateReceipt ( )
--------------------------------------------------------------------------------
	
	--
    local hUser = application.getCurrentUser ( )
    
    
    --Get holder.
    --
    local hHolder = hud.getComponent ( hUser, "main.Receipt" )
    
    --Getindividual containers
    --
    local hItems = hud.getComponent ( "main.Info" )
    local hItems = hud.getComponent ( "main.Items" )
    local hPayment = hud.getComponent ( "main.Payment" )
    
    --Get SceneItems
    --
    local tItemsScene = user.getAIVariable ( hUser, "MovingObject", "tObjectGroup" )
    log.message ( "Got table" )
    
    
    
    
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
