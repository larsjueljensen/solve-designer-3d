--------------------------------------------------------------------------------
--  Function......... : DestroyRoom
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.DestroyRoom ( )
--------------------------------------------------------------------------------

	local hRoom = scene.getTaggedObject ( application.getCurrentUserScene ( ), "User_Room" )
    
    if hRoom ~= nil then
        scene.destroyRuntimeObject ( application.getCurrentUserScene ( ), hRoom )
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
