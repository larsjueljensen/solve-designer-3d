--------------------------------------------------------------------------------
--  Function......... : HighlightSelection
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.HighlightSelection ( )
--------------------------------------------------------------------------------
	    log.message ( "Selectionhighlight" )
    local hUser = application.getCurrentUser ( )
    
    log.message ( "User = ", hUser )
    
    local hScene = application.getCurrentUserScene ( )
    local hPrevious = this.hPreviousObject ( ) 
    local hObject = this.hSelectedObject ( )
    
    
    
    
    
    
        if hObject then
        log.message ( "Retreived handle to selected object from stored variable: ", hObject )
        
        --Highlight selected model
        local nOpacity = shape.getMeshOpacity ( hObject )
        
        --this.nObjectOpacity ( nOpacity )
        
        
        log.message ( "Retreived mesh opacity: ", nOpacity )
        log.message ( "hObject: ", hObject )
        
        
        
        log.message ( "hPrevious: ", hPrevious )
            
  
            
            --Compare selection
            
            if ( hObject ~= nil ) and ( hPrevious ) then
                
                local sTag1 = scene.getObjectTag ( hScene, hObject )
                local sTag2 = scene.getObjectTag ( hScene, hPrevious )

            
                if string.compare ( sTag1, sTag2 ) then
               --if  object.isEqualTo ( hObject, hPrevious )  then 
               
               --if object.isEqualTo ( hObject, hPrevious )  then nOpacity == 1 and
                
                log.message ( "Same object selected" )
                    if this.nObjectOpacity ( ) == 1 then -- NOT highlighted
                    shape.setMeshOpacity ( hObject, 0.8 )-- set highlight values
                    this.hHighlightedObject ( this.hSelectedObject ( ) )
                    else
                    shape.setMeshOpacity ( hObject, 1.0 )
                    this.hHighlightedObject ( nil )
                    end
                else
                
                log.message ( "New object selected" )
                
                shape.setMeshOpacity ( hObject, 0.8 )
                
                
                shape.setMeshOpacity ( this.hPreviousObject ( ), 1.0 )
                --shape.overrideMeshMaterialAmbient ( hObject,1, 1, 1, 0.75 )
                
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
        
        local hNumberChild = object.getChildCount ( hObject )
        
        for i = 0, hNumberChild, 1
            do
            
            local hSelected = object.getChildAt ( hObject, 0 )
            
                if hSelected then
                --shape.overrideMeshMaterialDiffuse ( hSelected, 127, 255, 127, 100 )
                end
                
        end
    
    
    
    else
	
    --do stuff
    
    end
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
