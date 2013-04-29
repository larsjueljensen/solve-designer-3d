--------------------------------------------------------------------------------
--  Handler.......... : onZoomInButtonClicked
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onZoomInButtonClicked (  )
--------------------------------------------------------------------------------
	
    local hCam = application.getCurrentUserActiveCamera ( )
	local nCamX, nCamY, nCamZ = object.getTranslation ( hCam, object.kGlobalSpace )
	log.message ( "Cam" )
    
    object.sendEvent ( hCam, "ASPCamera", "onZoomBy",  0.2 )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
