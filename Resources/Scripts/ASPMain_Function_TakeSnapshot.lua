--------------------------------------------------------------------------------
--  Function......... : TakeSnapshot
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.TakeSnapshot ( )
--------------------------------------------------------------------------------
	
	local hudOk = hud.getComponent ( this.getUser ( ),"main.ButtonFrame1" )
    
    --log.message ( hudOk )       
    
    application.saveCurrentUserViewportToTexture ( "Bohus_snap.jpg", 640, 480 )

    
    
    this.SaveSnapshot ( )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
