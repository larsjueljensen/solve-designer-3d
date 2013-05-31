--------------------------------------------------------------------------------
--  Function......... : HighlightSelectedObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.HighlightSelectedObject ( hHitObject, hObject, nMode )
--------------------------------------------------------------------------------

    if hObject ~= nil then
        
        local r, g, b
        
        if nMode == 0 then --Highlight object

            r = 0.4
            g = 0.6
            b = 1.0
        
        elseif nMode == 1 then--Reset highlight

            r = 1
            g = 1
            b = 1
        
        end
       
        this.hTopNode ( hObject )
        this.hHighlightedObject ( hObject )

        local nChildren = object.getChildCount( hObject )
        local nFactor = 1

        for i = 0, nChildren -1 do        
            
            local hChild = object.getChildAt( hObject, i)
            shape.overrideMeshMaterialDiffuse ( hChild, r, g, b, nFactor )
            nChildren = object.getChildCount ( hChild )

            for i = 0, nChildren - 1 do                        
                local hChild = object.getChildAt ( hChild, i )
                
                shape.overrideMeshMaterialDiffuse ( hChild, r, g, b, nFactor )
                nChildren = object.getChildCount ( hChild )
                for i = 0, nChildren - 1 do
                    local hChild = object.getChildAt( hChild , i )
                    shape.overrideMeshMaterialDiffuse ( hChild, r, g, b, nFactor )
                end     
            end
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
