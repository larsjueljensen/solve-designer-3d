--------------------------------------------------------------------------------
--  Function......... : hasParent
--  Author........... : Lars Juel Jensen
--  Description...... : Returns wether or not a 3D object has any parents
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.hasParent ( hObject )
--------------------------------------------------------------------------------

    return object.getParent ( hObject ) ~= nil
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------