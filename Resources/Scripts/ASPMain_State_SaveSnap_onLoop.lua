--------------------------------------------------------------------------------
--  State............ : SaveSnap
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.SaveSnap_onLoop ( )
--------------------------------------------------------------------------------
	
    local nStatus = cache.getFileStatus ( "Bohus_snap.jpg" )
    
    local bHUD = hud.isComponentVisible ( hud.getComponent ( this.getUser ( ), "main.LoadScreen" ) )
    
--     if bHUD then
--     
--     else
--     log.message ( "File status: " , bHUD  )
-- 
--    	application.saveCurrentUserViewportToTexture ( "BOHUS_snap.jpg", 640, 480 )
--     
--     end
-- 
--     if nStatus == 1 then

--         this.Idle ( )
--     
--     else
--     
--  
--     end
--     
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
