--------------------------------------------------------------------------------
--  Function......... : ShowElement
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.ShowElement ( )
--------------------------------------------------------------------------------
	
	local hXML = this.BohusXML ( )
    
    
    log.message ( "Found xml : ", hXML )
    
    local hRoot = xml.getRootElement ( hXML )
    
    if hRoot then
    
    --Get first child element
    --
    
        local nCount = xml.getElementChildCount ( hRoot )    
        for i = 0, nCount - 1    
        do
        local hChild1 = xml.getElementChildAt ( hRoot, i )
        table.add ( this.tChildren ( ), xml.toString ( hChild1 ) )    
        log.message ( this.tChildren ( ), xml.toString ( hChild1 ) ) 
        
--             if hChild1 then
--                 --log.message( xml.toString ( xml.getElementFirstChildWithName ( hChild, 0 )            local nChildCount = xml.getElementChildCount ( hChild1 )
--             
--             log.message ( nChildCount )
--             
--             local hChild2 = xml.getElementFirstChild ( hChild1 )
--             
--             
--             
--             log.message ( hChild2 )
--             
--                         if hChild2 then
--                         --log.message( xml.toString ( xml.getElementFirstChildWithName ( hChild, 0 )) )
--                         local nChildCount = xml.getElementChildCount ( hChild2 )
--                         
--                         log.message ( nChildCount )
--                         
--                             for i = 0, nChildCount - 1
--                             do
--                                 --local hXMLEntry = xml.getElementFirstChild ( hChild2 )
--                                 local hXMLEntry = xml.getElementChildAt ( hChild2, i )
--                                                     
--                                 log.message (  hXMLEntry  )
--                                 
--                                 local nAttributeCount = xml.getElementAttributeCount ( hXMLEntry )
--                                 
--                                 log.message (  nAttributeCount  )
--                                 for i = 0, nAttributeCount - 1 
--                                 do
--                                 
--                                 
--                                 local hAttribute = xml.getElementAttributeAt ( hXMLEntry, i )
--                                 
--                                 log.message (  hAttribute  )
--                                 
--                                 local vValue = xml.getAttributeValue ( hAttribute )
--                                 
--                                 log.message ( xml.getAttributeValue ( hAttribute ) )
--                                 
--                                 end
--                              end
--                         end
-- 
--             
--             
--             end
--         
        
        end
    
    local hAttribute = xml.getElementAttributeAt ( hRoot, 0 )
    
    log.message ( xml.getAttributeValue ( hAttribute ) )
	
    end
    
    
    --this.SetXML ( )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
