--------------------------------------------------------------------------------
--  Function......... : GetContent
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.GetContent ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
	local tObjects = user.getAIVariable ( this.getUser ( ), "MovingObject", "tObjectGroup" )
    local hList = hud.getComponent ( hUser, "DialogsHUD.SceneObjects" )
    log.message ( "got handle to table: ", tObjects )
    
    local nSize = table.getSize ( tObjects )
    
    
    hud.addListColumn ( hList )
    hud.addListColumn ( hList )
    hud.addListColumn ( hList )
    hud.addListColumn ( hList )
    hud.addListColumn ( hList )
    hud.addListColumn ( hList )

    
    hud.setListColumnWidthAt ( hList, 0, 8 )
    hud.setListColumnWidthAt ( hList, 1, 22 )
    hud.setListColumnWidthAt ( hList, 2, 40 )
    hud.setListColumnWidthAt ( hList, 3, 12.5 )
    hud.setListColumnWidthAt ( hList, 4, 12.5 )
    hud.setListColumnWidthAt ( hList, 5, 5 )

    
    
    
    
    --Populate list data
    for i = 0, nSize - 1
    do
    
    local sNr = i
    local sItem = table.getAt ( tObjects, i )
    hud.addListItem ( hList, ""  )
    
    hud.setListItemTextAt ( hList,i,0, ""..sNr )
    hud.setListItemTextAt ( hList, i, 1, sItem )
    hud.setListItemTextAt ( hList,i ,2 , "Beskrivelse_" )
    hud.setListItemTextAt ( hList,i ,3 , "1" )
    hud.setListColumnTextAlignmentAt ( hList, 3, hud.kAlignRight, hud.kAlignCenter )
    hud.setListItemTextAt ( hList,i ,4 , "0.00" )
    hud.setListColumnTextAlignmentAt ( hList, 4, hud.kAlignRight, hud.kAlignCenter )
    end
    
    
    
     
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
