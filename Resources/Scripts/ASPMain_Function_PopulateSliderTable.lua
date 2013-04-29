--------------------------------------------------------------------------------
--  Function......... : PopulateSliderTable
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.PopulateSliderTable ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser (  )
    
	--
	-- Adding dummydata
	--
	
    local tTableCabinets = this.tCabinets()
    
    log.message ( "Populate slider table" )

    table.add (tTableCabinets, "3371500" )
    table.add ( tTableCabinets, "3371000" )
    table.add ( tTableCabinets, "3371500" )
    table.add ( tTableCabinets, "3371520" )
    table.add ( tTableCabinets, "3371000" )
    
    
    
    local tTableFronts = this.tFronts() 

    table.add ( tTableFronts, "3371580" )
    table.add ( tTableFronts, "3371600" )
  

    
    
    local tTableSliding = this.tSliding()
    log.message ( "" )

    table.add ( tTableSliding, "3378100" )
    table.add ( tTableSliding, "3378150" )
    table.add ( tTableSliding, "3378200" )
    table.add ( tTableSliding, "3378300" )
    table.add ( tTableSliding, "3378400" )
    table.add ( tTableSliding, "3378500" )
    table.add ( tTableSliding, "3378550" )
    table.add ( tTableSliding, "3378600" )
    table.add ( tTableSliding, "3378650" )
    table.add ( tTableSliding, "3378800" )
    table.add ( tTableSliding, "3378850" )
    table.add ( tTableSliding, "3371500" )
    table.add ( tTableSliding, "3378900" )
    
    local tTableHolding = this.tStorage()

    table.add ( tTableHolding, "3371810" )
    table.add ( tTableHolding, "3371860" )
    table.add ( tTableHolding, "3371880" )
    table.add ( tTableHolding, "3372030" )
    table.add ( tTableHolding, "3372510" )
    table.add ( tTableHolding, "3372530" )
    table.add ( tTableHolding, "3372710" )
    table.add ( tTableHolding, "3372720" )
    table.add ( tTableHolding, "3372730" )
    
    
    local tTableShelving = this.tShelving()
    
    
    table.add ( tTableShelving, "3377000" )
    table.add ( tTableShelving, "3377560" )
    table.add ( tTableShelving, "3377500" )
    table.add ( tTableShelving, "3377510" )
    table.add ( tTableShelving, "3377520" )
    table.add ( tTableShelving, "3377550" )
    
    local tTableAccessoirs = this.tAccessories ( )

    table.add ( tTableAccessoirs, "3371500" )
    table.add ( tTableAccessoirs, "3371510" )
    table.add ( tTableAccessoirs, "3371520" )
    table.add ( tTableAccessoirs, "3371500" )
    table.add ( tTableAccessoirs, "3371510" )
    table.add ( tTableAccessoirs, "3371500" )
    table.add ( tTableAccessoirs, "3371520" )
    table.add ( tTableAccessoirs, "3371510" )
    table.add ( tTableAccessoirs, "3371500" )
    table.add ( tTableAccessoirs, "3371510" )
    table.add ( tTableAccessoirs, "3371500" )
    
    log.message ( "Populate slider table done." )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
