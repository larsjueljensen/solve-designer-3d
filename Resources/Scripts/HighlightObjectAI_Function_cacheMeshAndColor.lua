--------------------------------------------------------------------------------
--  Function......... : cacheMeshAndColor
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightObjectAI.cacheMeshAndColor ( hObject )
--------------------------------------------------------------------------------

    local nRed, nGreen, nBlue, nFactor = shape.getMeshSubsetMaterialDiffuseOverride ( hObject, 0 )

    table.add ( this.meshes ( ), hObject )
    table.add ( this.colorsRed ( ), nRed )
    table.add ( this.colorsGreen ( ), nGreen )
    table.add ( this.colorsBlue ( ), nBlue )
    table.add ( this.colorsFactor ( ), nFactor )


    for i = 0, object.getChildCount ( hObject ) - 1 do
        this.cacheMeshAndColor ( object.getChildAt ( hObject, i ) )
    end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
