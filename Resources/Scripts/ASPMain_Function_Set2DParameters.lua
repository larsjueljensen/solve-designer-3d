--------------------------------------------------------------------------------
--  Function......... : Set2DParameters
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.Set2DParameters ( )
--------------------------------------------------------------------------------
	
local hScene = application.getCurrentUserScene ( )

    local hFloor = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Floor" )
    local hWall_1= scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall2" )
    local hWall_2 = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall3" )

--Set wall colors
-- if hWall_1
-- then
-- 
--  local r, g ,b =  shape.getMeshSubsetMaterialDiffuseOverride ( hWall_1, 0 )
--  
--  this.WallR ( r )
--  this.WallG ( g )
--  this.WallB ( b )
-- 
-- 
--  shape.overrideMeshMaterialDiffuse ( hWall_1, 0, 0, 0, 1 )
--  shape.overrideMeshMaterialDiffuse ( hWall_2, 0, 0, 0, 1 )
-- 	
-- else
-- end    
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
