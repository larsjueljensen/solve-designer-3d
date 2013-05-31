--------------------------------------------------------------------------------
--  Function......... : isHelperObject
--  Author........... : Lars Juel Jensen
--  Description...... : Returns wether or not an object's model is the same as the given name
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Param hObject..........: An object in the scene to test
--  Param sHelperName......: The name of the model to test for. Should be one of the following:
--                         :  * "WardrobeObject"
--                         :  * "WardrobeGroup"
--                         :  * "MovingObjectGlobal"
--                         :  * "MovingObjectLocal"
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.isHelperObject ( hObject, sHelperName )
--------------------------------------------------------------------------------
	
    return string.compare ( sHelperName, object.getModelName ( hObject ) ) == 0
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
