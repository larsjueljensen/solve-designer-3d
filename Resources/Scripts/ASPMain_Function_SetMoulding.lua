--------------------------------------------------------------------------------
--  Function......... : SetMoulding
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.SetMoulding ( hWall , nIndex )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    --Create mouldings
    --
    local hMoulding = scene.createRuntimeObject ( hScene, "Wall2" )
    local bOk = scene.setRuntimeObjectTag ( hScene, hMoulding, "Wall_"..nIndex.."_baseboard" )
    local hTopMoulding = scene.createRuntimeObject ( hScene, "Wall2" )
    local bOk = scene.setRuntimeObjectTag ( hScene, hTopMoulding, "Wall_"..nIndex.."_moulding" )
    
    local nHeight = 24
    --Set translation.
    --
    if hMoulding ~= nil then
        object.matchTranslation ( hMoulding, hWall, object.kGlobalSpace )
        object.matchTranslation ( hTopMoulding, hWall, object.kGlobalSpace )
        
        local x, y, z = object.getTranslation ( hMoulding, object.kGlobalSpace )
        
        object.matchRotation ( hMoulding, hWall, object.kGlobalSpace )
        object.matchRotation ( hTopMoulding, hWall, object.kGlobalSpace )
        
        local xScale, yScale, zScale = object.getScale( hWall )
        
        object.setScale ( hMoulding, xScale, 0.1, zScale )
        object.setScale ( hTopMoulding, xScale, 0.1, zScale )
        if nIndex == 1 then --Leftwall
            object.setTranslation ( hMoulding, x , y, z + 0.1,  object.kGlobalSpace )
            object.setTranslation ( hTopMoulding, x , y + nHeight, z+0.1,  object.kGlobalSpace )
        elseif nIndex == 2 then --Frontwall 
            object.setTranslation ( hMoulding, x , y, z - 0.1,  object.kGlobalSpace )
            object.setTranslation ( hTopMoulding, x , y + nHeight, z - 0.1,  object.kGlobalSpace )

        elseif nIndex == 3 then --Rightwall  
            object.setTranslation ( hMoulding, x -  0.1, y, z,  object.kGlobalSpace )
            object.setTranslation ( hTopMoulding, x - 0.1, y + nHeight, z,  object.kGlobalSpace )

        elseif nIndex == 4 then --Rightwall  
            object.setTranslation ( hMoulding, x +  0.1, y, z,  object.kGlobalSpace )
            object.setTranslation ( hTopMoulding, x + 0.1, y + nHeight, z,  object.kGlobalSpace )
        
        
        end
        
        object.setParent ( hMoulding, hWall, true )
        shape.setMeshMaterial ( object.getChildAt (  hMoulding, 0 ) , "BohusWall")
        object.setParent ( hTopMoulding, hWall, true )
        shape.setMeshMaterial ( object.getChildAt (  hTopMoulding, 0 ), "BohusWall")


    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
