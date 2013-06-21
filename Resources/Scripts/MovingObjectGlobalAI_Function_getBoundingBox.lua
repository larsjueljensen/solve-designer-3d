--------------------------------------------------------------------------------
--  Function......... : getBoundingBox
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectGlobalAI.getBoundingBox ( hObject )
--------------------------------------------------------------------------------

    local x, y, z = object.getTranslation ( this.getObject ( ), object.kGlobalSpace ) 
    local minx, miny, minz, maxx, maxy, maxz = this.getBoundingBoxFromPos ( this.getObject ( ), x, y, z, object.kGlobalSpace )
    return minx, miny, minz, maxx, maxy, maxz

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
