--------------------------------------------------------------------------------
--  State............ : SaveXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.SaveXML_onEnter (  )
--------------------------------------------------------------------------------
	
    log.message ( "Entry saveXML state" )
    
    local xSaveXML
    
    local nType = this.CurrentXMLtype ( )
    
    if nType == 0 then
    
    xSaveXML = this.BohusXML ( )
    
    elseif nType == 1 then
    
    xSaveXML = this.ResourceXML ( )
    
    elseif nType == 2 then
    
    xSaveXML = this.StringXML()
    
    end
    
    if xSaveXML then
    xml.send( xSaveXML , "file://C:/XMLSave/BohusSave.xml" ) 
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
