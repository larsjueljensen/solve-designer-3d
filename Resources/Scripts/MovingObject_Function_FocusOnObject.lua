--------------------------------------------------------------------------------
--  Function......... : FocusOnObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.FocusOnObject ( )
--------------------------------------------------------------------------------
	
    local nDist = 50
    
	local hCam = application.getCurrentUserActiveCamera ( )
    log.message ( "Gat active user camera: ", hCam )
    
    log.message ( "Last object: ", this.hLastObject ( ) )
    
    local nPx, nPy, nPz = object.getTranslation (  this.hLastObject ( ), object.kGlobalSpace ) 
    
    log.message ( "Got object translation: ", nPx,"   ", nPy,"   ", nPz  )
    
    object.matchTranslation (hCam, this.hLastObject ( ), object.kGlobalSpace)
    --object.setTranslation (hCam, 0, 0, nDist, object.kGlobalSpace )
    
    
    --object.matchTranslation ( hCam, this.hLastObject ( ), object.kGlobalSpacelobalSpace  )
    --object.lookAt ( hCam, nPx, nPy, nPz, object.kGlobalSpace , 1 )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
