--------------------------------------------------------------------------------
--  Function......... : isWardrobeObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function RuleMouseController.isWardrobeObject ( hObject )
--------------------------------------------------------------------------------

    return string.compare ( "WardrobeObject", object.getModelName ( hObject ) ) == 0

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
