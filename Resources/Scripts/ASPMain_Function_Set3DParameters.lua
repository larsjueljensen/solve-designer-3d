--------------------------------------------------------------------------------
--  Function......... : Set3DParameters
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.Set3DParameters ( )
--------------------------------------------------------------------------------
	
local hScene = application.getCurrentUserScene ( )
local hUser = application.getCurrentUser ( )

    local hFloor = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Floor" )
    local hWall_1= scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall2" )
    local hWall_2 = scene.getTaggedObject ( application.getCurrentUserScene ( ), "Wall3" )

--Set wall colors

local r = user.getAIVariable (  hUser, "ASPRoom_AI", "WallColorRed" )
local g = user.getAIVariable (  hUser, "ASPRoom_AI", "WallColorGreen" )
local b = user.getAIVariable (  hUser, "ASPRoom_AI", "WallColorBlue" )


-- log.message ( "Got wallColor = ", r ) 
-- --vValue = user.getAIVariable ( hUser, sAIModel, sVariable )
-- 
-- 
--  shape.overrideMeshMaterialDiffuse ( hWall_1, r, g, b, 1 )
--  shape.overrideMeshMaterialDiffuse ( hWall_2, r, g, b, 1 )
-- 	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
