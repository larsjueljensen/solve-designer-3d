--------------------------------------------------------------------------------
--  Function......... : HighlightSelection
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.HighlightSelection ( )
--------------------------------------------------------------------------------

    local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    local hPrevious = this.hPreviousObject ( ) 
    local hObject = this.hSelectedObject ( )
    
    if hObject then
        
        local nOpacity = shape.getMeshOpacity ( hObject )
        
        if ( hObject ~= nil ) and ( hPrevious ) then
            
            local sTag1 = scene.getObjectTag ( hScene, hObject )
            local sTag2 = scene.getObjectTag ( hScene, hPrevious )

            if string.compare ( sTag1, sTag2 ) then
                
                if this.nObjectOpacity ( ) == 1 then -- NOT highlighted
                    shape.setMeshOpacity ( hObject, 0.8 )-- set highlight values
                    this.hHighlightedObject ( this.hSelectedObject ( ) )
                else
                    shape.setMeshOpacity ( hObject, 1.0 )
                    this.hHighlightedObject ( nil )
                end

            else

                shape.setMeshOpacity ( hObject, 0.8 )
                shape.setMeshOpacity ( this.hPreviousObject ( ), 1.0 )
            
            end
                
        else   --No previous selection made.
            this.hPreviousObject ( this.hSelectedObject ( ) )
            
            if this.nObjectOpacity ( ) == 1 then -- NOT highlighted
                shape.setMeshOpacity ( hObject, 0.9 )-- set highlight values
                this.hHighlightedObject ( this.hSelectedObject ( ) )
            else
                shape.setMeshOpacity ( hObject, 1.0 )
                this.hHighlightedObject ( nil )
            end
        end
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
