--------------------------------------------------------------------------------
--  Function......... : getVector
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlReader.getVector ( hArticle3DElement, sVectorName )
--------------------------------------------------------------------------------

    local hVectorElement = xml.getElementFirstChildWithName ( hArticle3DElement, sVectorName )
    
    if ( hVectorElement ~= nil ) then
    
        local hXElement = xml.getElementFirstChildWithName ( hVectorElement, "x" )
        local hYElement = xml.getElementFirstChildWithName ( hVectorElement, "y" )
        local hZElement = xml.getElementFirstChildWithName ( hVectorElement, "z" )
        
        local sX = xml.getElementValue ( hXElement )
        local sY = xml.getElementValue ( hYElement )
        local sZ = xml.getElementValue ( hZElement )
        
        return string.toNumber ( sX ), string.toNumber ( sY ), string.toNumber ( sZ )
    end
	
    return nil
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
