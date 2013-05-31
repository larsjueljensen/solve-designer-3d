--------------------------------------------------------------------------------
--  Function......... : highlightObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightObjectAI.highlightObject ( hObject, bTurnOn )
--------------------------------------------------------------------------------
        
    if (bTurnOn) then
        shape.overrideMeshMaterialDiffuse ( hObject, 0.8, 0.8, 1.0, 1.0 )
    else
        shape.overrideMeshMaterialDiffuse ( hObject, 0.8, 0.8, 0.8, 1.0 )    
    end

    for i = 0, object.getChildCount ( hObject ) - 1 do
        this.highlightObject ( object.getChildAt ( hObject, i ), bTurnOn )
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
