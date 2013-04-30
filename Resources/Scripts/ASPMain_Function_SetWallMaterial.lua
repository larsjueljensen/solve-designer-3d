--------------------------------------------------------------------------------
--  Function......... : SetWallMaterial
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.SetWallMaterial ( hWall, nIndex )
--------------------------------------------------------------------------------
	
    --shape.setMeshMaterial ( hWall, "Wallpaper")
    if nIndex == 0 then
        shape.setMeshMaterial ( hWall, "Wallpaper")
    elseif nIndex == 1 then
        shape.setMeshMaterial ( hWall, "Wallpaper")
        
    elseif nIndex == 2 then
        shape.setMeshMaterial ( hWall, "Wallpaper2")
    elseif nIndex == 3 then
        shape.setMeshMaterial ( hWall, "Wallpaper2")
    end
    
    

	
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
