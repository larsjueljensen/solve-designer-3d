--------------------------------------------------------------------------------
--  Function......... : highlightObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function HighlightObjectAI.highlightObject ( hObject, bTurnOn, nR, nG, nB, nF )
--------------------------------------------------------------------------------
    
    if not table.isEmpty ( this.meshes ( ) ) then
     
        for i = 0, table.getSize ( this.meshes ( ) ) - 1 do

            local hMesh = table.getAt ( this.meshes ( ), i )
            
            if ( bTurnOn ) then
                shape.overrideMeshMaterialDiffuse ( hMesh, 0.8, 0.8, 1.5, 1.0 )
            else
                local nRed = table.getAt ( this.colorsRed ( ), i )
                local nGreen = table.getAt ( this.colorsGreen ( ), i )
                local nBlue = table.getAt ( this.colorsBlue ( ), i)
                local nFactor = table.getAt ( this.colorsFactor ( ), i)
                
                shape.overrideMeshMaterialDiffuse ( hMesh, nRed, nGreen, nBlue, nFactor )
            end
        end    
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
