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
    local nPx, nPy, nPz = object.getTranslation (  this.hLastObject ( ), object.kGlobalSpace ) 

    object.matchTranslation (hCam, this.hLastObject ( ), object.kGlobalSpace)
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
