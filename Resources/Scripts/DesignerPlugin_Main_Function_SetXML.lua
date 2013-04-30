--------------------------------------------------------------------------------
--  Function......... : SetXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.SetXML ( )
--------------------------------------------------------------------------------
	
    local tObjectsInScene = user.getAIVariable ( this.getUser ( ), "MovingObject", "tObjectGroup" )
    
    local sModelName
    local x = 0
    local y = 0
    local z = 0
    
    local hSceneObject
    local sObjectTag
    
    
    local hScene = application.getCurrentUserScene ( )

    log.message ( "Get table of Objects in scene for XML : ", tObjectsInScene )
    
    local nObjects = table.getSize( tObjectsInScene )
    
    log.message ( "Number of Objects in scene: ", nObjects  )
    
    for i = 1, nObjects - 1
    do
        sObjectTag = table.getAt ( tObjectsInScene, i  )
        
        log.message ( "ObjectTag: ", sObjectTag )
        
        if sObjectTag then
        hSceneObject = scene.getTaggedObject ( hScene, sObjectTag  )
        x, y, z = object.getTranslation ( hSceneObject, object.kGlobalSpace )
        
        log.message( "x, y, z: ", x,"  ", y, "  ",  z )
        sModelName = object.getModelName ( hSceneObject )
        end
    end
    local hXML = this.BohusXML ( )
    
    this.CurrentXMLtype ( 2 )
    
    
    log.message ( "Found xml : ", hXML )
    
    local hRoot = xml.getRootElement ( hXML )
    
    if hRoot then
    
    --Get first child element
    --
    
        local nChildCount = xml.getElementChildCount ( hRoot )    
        for i = 0, nChildCount - 1    
        do
        local hChild1 = xml.getElementChildAt ( hRoot, i )
        table.add ( this.tChildren ( ), xml.toString ( hChild1 ) )    
        log.message ( this.tChildren ( ), xml.toString ( hChild1 ) ) 
        
            if hChild1 then
                --log.message( xml.toString ( xml.getElementFirstChildWithName ( hChild, 0 )            local nChildCount = xml.getElementChildCount ( hChild1 )
            
            log.message ( nChildCount )
            
            local hChild2 = xml.getElementFirstChild ( hChild1 )

            
            log.message ( hChild2 )
            
                        if hChild2 then
                        --log.message( xml.toString ( xml.getElementFirstChildWithName ( hChild, 0 )) )
                        local nChildCount = xml.getElementChildCount ( hChild2 )
                        
                        log.message ( nChildCount )
                        
                            for i = 0, nChildCount - 1
                            do
                                --local hXMLEntry = xml.getElementFirstChild ( hChild2 )
                                local hXMLEntry = xml.getElementChildAt ( hChild2, i )
                                                    
                                log.message (  hXMLEntry  )
                                
                                local nAttributeCount = xml.getElementAttributeCount ( hXMLEntry )
                                
                                log.message (  nAttributeCount  )
                                
                                for i = 0, nAttributeCount - 1 
                                do
                                
                                
                                local hAttribute = xml.getElementAttributeAt ( hXMLEntry, i )
                                
                                
                                
                                log.message (  hAttribute  )
                                
                                local vValue = xml.getAttributeValue ( hAttribute )
                                
                                --Get data from Object.
                                --
                                
                                
                                --Set Model ID.
                                --
                                
                                    if vValue == "Id" then
                                    
                                            local hSaveAttribute = xml.getElementAttributeAt ( hXMLEntry, i+1 )
                                            

                                            local vValue = xml.getAttributeValue ( hSaveAttribute )
                                            
                                            log.message ( "Attribute found: ", vValue )
                                            
                                            if sModelName ~= nil 
                                            then
                                            xml.setAttributeValue ( hSaveAttribute, sModelName )
                                            end
                                    end
                                    
                                    
                                    
--                                     if vValue == "X" then
--                                     
--                                             local hSaveAttribute = xml.getElementAttributeAt ( hXMLEntry, i+1 )
--                                             
-- 
--                                             local vValue = xml.getAttributeValue ( hSaveAttribute )
--                                             
--                                             log.message ( "Attribute  X found: ", x )
--                                             
--                                             x = math.roundToNearestInteger ( x )
--                                             log.message ( "Attribute  new X found: ", x )
--                                             
--                                             xml.setAttributeValue ( hSaveAttribute, x )
--                                             
--                                             log.message ( "Attribute  new X found: ", x )
--                                     end
--                                     
--                                     if vValue == "Y" then
--                                     
--                                             local hSaveAttribute = xml.getElementAttributeAt ( hXMLEntry, i+1 )
--                                             
-- 
--                                             local vValue = xml.getAttributeValue ( hSaveAttribute )
--                                             
--                                             log.message ( "Attribute  Y found: ", x )
--                                             
--                                             xml.setAttributeValue ( hSaveAttribute, y )
--                                     end
--                                     
--                                     if vValue == "Z" then
--                                     
--                                             local hSaveAttribute = xml.getElementAttributeAt ( hXMLEntry, i+1 )
--                                             
-- 
--                                             local vValue = xml.getAttributeValue ( hSaveAttribute )
--                                             
--                                             log.message ( "Attribute  Y found: ", vValue )
--                                             
--                                             xml.setAttributeValue ( hSaveAttribute, z )
--                                     end
--                                     
--                                     if vValue == "Rotation" then
--                                     
--                                             local hSaveAttribute = xml.getElementAttributeAt ( hXMLEntry, i+1 )
--                                             
-- 
--                                             local vValue = xml.getAttributeValue ( hSaveAttribute )
--                                             
--                                             log.message ( "Attribute  Y found: ", vValue )
--                                             
--                                             xml.setAttributeValue ( hSaveAttribute, 0 )
--                                    end
--
                                    
                                    
                                        

                                    
                                    
                                log.message ( vValue )
                                
                                end
                             end
                        end

            
            
            end
        
        
        end
    
    local hAttribute = xml.getElementAttributeAt ( hRoot, 2 )
    
    log.message ( xml.getAttributeValue ( hAttribute ) )
	
    end
    
    local hElement = xml.getElementChildAt (  xml.getElementChildAt (  hRoot, 0 ), 0 )
    
    --local hAttributeID = xml.getElementChildAt ( xml.getElementChildAt ( hRoot, 0 ) )

    local vValue = xml.getElementAttributeAt ( hElement, 1 )
    
    log.message ( "Retreived attribute value_scene: ", vValue )
    
--     for i = 1, nObjects - 1
--     do
--     
--     
--     log.message ( "Scene object #", i, " is model of type ", sModelName )
--     
--     end
--     
    
    
    this.SendXML ( )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
