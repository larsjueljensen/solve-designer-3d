--------------------------------------------------------------------------------
--  Function......... : swapObjectsPosition
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.swapObjectsPosition ( hObjectA, hObjectB, space )
--------------------------------------------------------------------------------

    local ax, ay, az = object.getTranslation ( hObjectA, space )
    local bx, by, bz = object.getTranslation ( hObjectB, space )
    object.setTranslation ( hObjectA, bx, by, bz, space )
    object.setTranslation ( hObjectB, ax, ay, az, space )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
