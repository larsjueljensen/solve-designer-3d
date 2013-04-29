--------------------------------------------------------------------------------
--  Function......... : MergeTables
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.MergeTables ( tCategories )
--------------------------------------------------------------------------------
	
    --RESET TABLE.
    --
    
    --log.message ( "Received categories table ", tCategories )
    
    local nSize = table.getSize ( tCategories )
    
    log.message ( "Table has ", nSize, " categories to merge." )
    
    for i = 0, nSize - 1 
    do
    
    local sCat = table.getAt ( tCategories, i )
    
        if string.compare ( sCat, "HULLS" ) == 0 then
        
            local nTableSize = table.getSize ( this.tCabinets ( ) )
        
            for i = 0, nTableSize-1 
            do
            local vValue = table.getAt ( this.tCabinets ( ), i )
            table.add ( this.tCatCombi ( ), vValue )
            end
        
        elseif string.compare ( sCat, "FRONTS" ) == 0 then
            local nTableSize = table.getSize ( this.tFronts ( ) )
        
            for i = 0, nTableSize-1 
            do
            local vValue = table.getAt ( this.tFronts ( ), i )
            table.add ( this.tCatCombi ( ), vValue )
            end
       
        
        elseif string.compare ( sCat, "SLIDING_DOORS" ) == 0 then
            local nTableSize = table.getSize ( this.tSliding ( ) )
        
            for i = 0, nTableSize-1 
            do
            local vValue = table.getAt ( this.tSliding ( ), i )
            table.add ( this.tCatCombi ( ), vValue )
            end
        
        elseif string.compare ( sCat, "STORAGE" ) == 0 then
            local nTableSize = table.getSize ( this.tStorage ( ) )
        
            for i = 0, nTableSize-1 
            do
            local vValue = table.getAt ( this.tStorage ( ), i )
            table.add ( this.tCatCombi ( ), vValue )
            end
        
        elseif string.compare ( sCat, "SHELVES" ) == 0 then
            local nTableSize = table.getSize ( this.tShelving ( ) )
        
            for i = 0, nTableSize-1 
            do
            local vValue = table.getAt ( this.tShelving ( ), i )
            table.add ( this.tCatCombi ( ), vValue )
            end
        
        elseif string.compare ( sCat, "ACCESSORIES" ) == 0 then
            local nTableSize = table.getSize ( this.tAccessories ( ) )
        
            for i = 0, nTableSize-1 
            do
            local vValue = table.getAt ( this.tAccessories ( ), i )
            table.add ( this.tCatCombi ( ), vValue )
            end
        end --end string compare

    
    
    end
    
return this.tCatCombi( )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
