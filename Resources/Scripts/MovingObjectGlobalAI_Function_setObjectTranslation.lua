--------------------------------------------------------------------------------
--  Function......... : setObjectTranslation
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.setObjectTranslation ( hObject, x, y, z, space )
--------------------------------------------------------------------------------
	
    local resx, resy, resz = x, y, z
    
    local hSnapToObject = this.getClosestSnapObject( resx, resy, resz, space )
    
    if (hSnapToObject ~= nil) then
        resx, resy, resz = this.snapToSnapObject( hObject, hSnapToObject, resx, resy, resz, space )
    end
    
    resx, resy, resz = this.keepObjectWithinWalls( hObject, resx, resy, resz, space )
        
    object.setTranslation ( hObject, resx, resy, resz, space )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
