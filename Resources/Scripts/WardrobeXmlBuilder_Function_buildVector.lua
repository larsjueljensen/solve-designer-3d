--------------------------------------------------------------------------------
--  Function......... : buildVector
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.buildVector ( hObject, sName, getXYZ )
--------------------------------------------------------------------------------

    local hElement = this.createNewElement ( sName )
    local x, y, z = getXYZ ( hObject, object.kGlobalSpace )    
    this.buildXYZ ( hElement, x, y, z )
    return hElement	

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
