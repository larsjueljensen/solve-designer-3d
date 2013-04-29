--------------------------------------------------------------------------------
--  Function......... : DestroyRoom
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.DestroyRoom ( )
--------------------------------------------------------------------------------
	local hScene = application.getCurrentUserScene ( )
	local hRoom = scene.getTaggedObject ( hScene, "User_Room" )
    
    --log.message ( "CreateRoom :Got handle to null: ", hRoom)
    
    
    
    if hRoom ~= nil then
    
    --destroy room.
    --
    
--     local nChildren = object.getChildCount ( hRoom )
--     
--     log.message ( "Object has ", nChildren, " child objects." )
--     
--     for i = 0, nChildren - 1
--     do
--     local hChildObject = object.getChildAt ( hRoom, i )
--     
--     log.message ( hChildObject )
--         if hChildObject ~= nil 
--         then
--         local hFloor = scene.getTaggedObject ( hScene, "Floor" )
--         
--         if hFloor then
--         scene.destroyRuntimeObject ( hScene, hFloor )
--         else
--         end
--         
--         local hWall2 = scene.getTaggedObject ( hScene, "Wall2" )
--         if hWall2 then
--         scene.destroyRuntimeObject ( hScene, hWall2 )
--         else
--         end
--         local hWall3 = scene.getTaggedObject ( hScene, "Wall3" )
--         if hWall3 then
--         scene.destroyRuntimeObject ( hScene, hWall3 )
--         else
--         end
-- 
--         
--         
--             local nSubChildren = object.getChildCount ( hChildObject )
--             for i = 0, nSubChildren - 1
--             do
--             local hSubChildObject = object.getChildAt ( hChildObject, i )
--             if hSubChildObject then
--             scene.destroyRuntimeObject ( hScene, hSubChildObject )
--             end
--         end
--         
--         
--         scene.destroyRuntimeObject ( hScene, hChildObject )
--         end
--     end
--     
    scene.destroyRuntimeObject ( hScene, hRoom )
    
    end
    
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
