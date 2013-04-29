--------------------------------------------------------------------------------
--  Handler.......... : onCreatePaletteTable
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.onCreatePaletteTable (  )
--------------------------------------------------------------------------------
	
    local tTable = user.getAIVariable ( this.getUser ( ), "DesignerPlugin_Main",  "tCategories" )
    table.empty ( this.tCatCombi ( ) )
	log.message ( tTable )
    
    local nSize = table.getSize ( tTable )
    
    
    local tTable = this.MergeTables ( tTable )
    
    for i = 0, nSize -1
    do
        if string.compare ( table.getAt ( tTable, i ), "HULLS" ) == 0 then
        
            local nTableSize = table.getSize ( this.tCabinets ( ) )
        
        elseif string.compare ( table.getAt ( tTable, i ), "FRONTS" ) == 0 then
        
            local nTableSize = table.getSize ( this.tFronts ( ) )

        elseif string.compare ( table.getAt ( tTable, i ), "SLIDING_DOORS" ) == 0 then
            
            local nTableSize = table.getSize ( this.tSliding ( ) )


        elseif string.compare ( table.getAt ( tTable, i ), "STORAGE" ) == 0 then
        
            local nTableSize = table.getSize ( this.tStorage ( ) )


        elseif string.compare ( table.getAt ( tTable, i ), "SHELVES" ) == 0 then
             local nTableSize = table.getSize ( this.tShelving ( ) )
        elseif string.compare ( table.getAt ( tTable, i ), "ACCESSORIES" ) == 0 then
             local nTableSize = table.getSize ( this.tAccessories ( ) )


        end --end string compare

    
    end
    
    local bOk = this.SetSliderThumbs ( )
    
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
