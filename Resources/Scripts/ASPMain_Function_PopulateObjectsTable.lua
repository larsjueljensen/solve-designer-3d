--------------------------------------------------------------------------------
--  Function......... : PopulateObjectsTable
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.PopulateObjectsTable ( )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser ()
    
    local hTable = this.tCachedObjects ( )
    
    if hTable then
    table.add ( hTable, "117768" )
    table.add ( hTable, "3371000" )
    table.add ( hTable, "3371510" )
    table.add ( hTable, "3371511" )
    table.add ( hTable, "3371520" )
    table.add ( hTable, "3371580" )
    table.add ( hTable, "3371600" )
    table.add ( hTable, "3371810" )
    table.add ( hTable, "3371860" )
    table.add ( hTable, "3371880" )
    table.add ( hTable, "3372010" )
    table.add ( hTable, "3372030" )
    table.add ( hTable, "3372510" )
    table.add ( hTable, "3372530" )
    table.add ( hTable, "3372710" )
    table.add ( hTable, "3372720" )
    table.add ( hTable, "3372730" )
    table.add ( hTable, "3377000" )     
    table.add ( hTable, "3377500" )
    table.add ( hTable, "3377510" )
    table.add ( hTable, "3377520" )
    table.add ( hTable, "3377550" )
    table.add ( hTable, "3377560" )
    table.add ( hTable, "3378100" )
    table.add ( hTable, "3378150" )
    table.add ( hTable, "3378200" )
    table.add ( hTable, "3378300" )
    table.add ( hTable, "3378400" )
    table.add ( hTable, "3378500" )
    table.add ( hTable, "3378550" )
    table.add ( hTable, "3378600" )
    table.add ( hTable, "3378650" )
    table.add ( hTable, "3378800" )
    table.add ( hTable, "3378850" )
    table.add ( hTable, "3378900" )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------