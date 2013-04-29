--------------------------------------------------------------------------------
--  Function......... : HighlightSelectedObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.HighlightSelectedObject ( hHitObject, hObject, nMode )
--------------------------------------------------------------------------------
	
	--log.message(  hHitObject, "   ", hObject)  
	--log.message ( "HighlightSelectedObject: ", hHitObject, "  ", hObject, "  ", nMode )
    
    local nFactor = 1
    if hObject ~= nil then
        local nChildren = object.getChildCount( hObject )
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

            if nChildren > 0 then
            
            log.message ( "object: ", hObject, " has children: ", nChildren )
            
                for i = 0, nChildren -1
                do        
                local hChild = object.getChildAt( hObject, i)
                shape.overrideMeshMaterialDiffuse ( hChild, r, g, b, nFactor )
                nChildren = object.getChildCount ( hChild )
                    if nChildren > 0 then

                    --log.message ( "object: ",hChild, " has children: ", nChildren )

                            for i = 0, nChildren - 1
                            do                        
                            local hChild = object.getChildAt ( hChild, i )
                            
                            --log.message( hChild) 
                            
                            shape.overrideMeshMaterialDiffuse ( hChild, r, g, b, nFactor )
                            nChildren = object.getChildCount ( hChild )
                                if nChildren > 0 then
                                
                                --log.message ( "object: ",hChild, " has children: ", nChildren )

                                    for i = 0, nChildren - 1 
                                    do
                                    local hChild = object.getChildAt( hChild , i )
                                    shape.overrideMeshMaterialDiffuse ( hChild, r, g, b, nFactor )
                                    end     
                                end
                            end
                        end
                    end
                end
            end
--     local nChildren = object.getChildCount ( hObject )
--     local r, g, b, nFactor
--     
--     
--     if nMode == 0 then -- Highlight object
--     this.hHighlightedObject ( hObject )
--     r = 0.4
--     g = 0.6
--     b = 1.0
--     nFactor = 1
--     
--     --reset highlight on previous object
--     
--     elseif nMode == 1  then --reset highlight 
--     
--     r = 1
--     g = 1
--     
--     end
--     
--     
--     if hObject ~= nil  then
--         this.hTopNode ( hObject )    
-- 
--         if nChildren > 0 then
--             for i = 0, nChildren -1 
--             do
--                 local hChild = object.getChildAt ( hObject, i )
--                 shape.overrideMeshMaterialDiffuse ( hChild,  r , g, b, nFactor )
--                 
--                 nChildren = object.getChildCount ( hChild )    
--                 if nChildren > 0 then
--                     for i = 0, nChildren -1 
--                     do
--                     local nChild = object.getChildAt ( hChild, i )
--                     shape.overrideMeshMaterialDiffuse ( hChild,  r , g, b, nFactor )
--                 
--                         for i = 0, nChildren -1 
--                         do
--                         local nChild = object.getChildAt ( hChild, i )
--                         shape.overrideMeshMaterialDiffuse ( hChild,  r , g, b, nFactor )
--                         end
--                     end
--                 end
--             end
--         end
--     end    
-- 	
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
