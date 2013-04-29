--------------------------------------------------------------------------------
--  Function......... : SetDefaultRotation
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.SetDefaultRotation ( )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene()
    local hUser = this.getUser()
    --local hHolder = hud.getComponent ( hUser, "main.SelectionHolder" )
    --local hTab = hud.getComponent ( hUser, "main.Mod_Tab_1" )
    --log.message ( "Got hHolder: ", hHolder )
    
    
    local hRotList_1 = hud.getComponent ( hUser, "main.DefaultRotation" )
--     local hRotList_2 = hud.getComponent ( hUser, "MoveObjectHUD.ModulesList_2" )
--     local hRotList_3 = hud.getComponent ( hUser, "MoveObjectHUD.ModulesList_3" )
--     
    --local nIndex = hud.addListColumn ( hModList_1 )
    --local nIndex = hud.addListColumn ( hModList_1 )
    
    
    
    hud.setListItemsHeight ( hRotList_1, 50 )
    hud.setListTextHeight ( hRotList_1, 25)    
    --hud.setListColumnWidthAt ( hModList_1, 0, 35 )
    --hud.setListColumnWidthAt ( hModList_1, 1, 60 )
    --hud.setListColumnWidthAt ( hModList_1, 2, 5 )
    
   -- hud.setComponentRotation ( hHolder, 90 )
    --hud.setComponentRotation ( hTab, 90 )
   --hud.setComponentRotation ( hModList_1, 90 )

    
    
 
    
    
    --hud.setListColumnTextAlignmentAt ( hModList_1, 1, hud.kAlignLeft, hud.kAlignCenter )
    hud.setListColumnTextAlignmentAt ( hRotList_1, 0, hud.kAlignLeft, hud.kAlignTop )
    
    
    
    
    
    
    
    
for i=0,42
do
hud.addListItem ( hRotList_1, "" )

end
hud.enableListFingerScrolling ( hRotList_1, true )

hud.setListItemIconAt ( hRotList_1, 0, 0, "3371000")
--hud.setListItemTextAt ( hRotList_1, 0, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 1, 0, "3371510")
--hud.setListItemTextAt ( hRotList_1, 1, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 2, 0, "3371510_1")
--hud.setListItemTextAt ( hRotList_1, 2, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 3, 0, "")
--hud.setListItemTextAt ( hRotList_1, 3, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 4, 0, "")
--hud.setListItemTextAt ( hRotList_1, 4, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 5, 0, "")
--hud.setListItemTextAt ( hRotList_1, 5, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 5, 0, "")
--hud.setListItemTextAt ( hRotList_1, 5, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 5, 0, "")
--hud.setListItemTextAt ( hRotList_1, 5, 1, "Modul    - Art.nr BxDxH" )

hud.setListItemIconAt ( hRotList_1, 5, 0, "")
--hud.setListItemTextAt ( hRotList_1, 5, 1, "Modul    - Art.nr BxDxH" )


--get/set default values.

hashtable.add ( this.htRotation ( ), "3371500",  0 )
hashtable.add ( this.htRotation ( ), "3371510", 0 )
hashtable.add ( this.htRotation ( ), "3371520", 90 )
hashtable.add ( this.htRotation ( ), "", 0 )
hashtable.add ( this.htRotation ( ), "", 90 )
hashtable.add ( this.htRotation ( ), "", 90 )
hashtable.add ( this.htRotation ( ), "", 90 )
hashtable.add ( this.htRotation ( ), "", 90 )
hashtable.add ( this.htRotation ( ), "", 90 )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
