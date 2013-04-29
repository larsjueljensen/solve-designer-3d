--------------------------------------------------------------------------------
--  Handler.......... : onHighlightObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onHighlightObject ( hHitObject, hObject )
--------------------------------------------------------------------------------
	--log.message ( "onHighlightObject" )
if hObject ~= nil then
     
    if this.hHighlightedObject ( ) == nil then
    
    else
        if object.isEqualTo ( hObject, this.hHighlightedObject ( ) ) == true then
        log.message ( "Same object hit" )
        else
        log.message ( "New object hit" )
        --Turn of current highlight
        --
        this.HighlightSelectedObject ( hHitObject, this.hHighlightedObject ( ), 1 )
        
        this.hHighlightedObject ( hObject )
        this.HighlightSelectedObject ( hHitObject, hObject, 0 )
        end
    end    
end    
    
--     
if hHitObject ~= nil then
local bSensorType = sensor.getCategoryBitAt ( hHitObject, 0 , 4 )
local bSensorTypeAddon = sensor.getCategoryBitAt ( hHitObject, 0 , 5 )
    if bSensorType then
        if bSensorTypeAddon then --object is addon
        
        log.message (  "Hit addon object")
        --this.HighlightSelectedObject ( hHitObject, hHitObject, 0 )
        log.message ( "Hit: ", hHitObject )
        
        local hObject = object.getParent ( hHitObject )
        
        log.message ( "Hit: ", hObject )
        this.HighlightSelectedObject ( hHitObject, hObject, 0 )
        
        end
    
    --log.message ( "Highlight obj" )
    this.hHighlightedObject ( hObject )
    
    else
    
        if this.hHighlightedObject ( ) ~= nil then
        this.HighlightSelectedObject ( hHitObject, this.hHighlightedObject ( ), 1 )
        end
    
   -- log.message ( "No highlight" )
   
    end
end
-- 	if this.hHighlightedObject ( ) == nil then
--     
--     
--         this.HighlightSelectedObject( hHitObject, hObject, 0 )
--     
--     
--         if object.isEqualTo ( this.hHighlightedObject ( ), this.hTopNode ( ) ) then 
--         --on current object
--         
--         else
--         
--         this.HighlightSelectedObject( hHitObject, hObject, 0 )
--         
--         --reset previous object.
--         --
--         this.HighlightSelectedObject ( hObject, this.hHighlightedObject ( ), 1 )
--         
--         end
--     end    
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
