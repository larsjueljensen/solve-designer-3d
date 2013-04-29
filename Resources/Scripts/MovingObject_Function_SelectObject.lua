--------------------------------------------------------------------------------
--  Function......... : SelectObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.SelectObject ( sName )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser ( )
    local hList1 = hud.getComponent ( hUser, "MoveObjectHUD.ModulesList_1" )
    local nPosX, nPosY = hud.getCursorPosition (  hUser )
    local hBtnPressed = hud.getComponentAtPoint ( hUser, nPosX, nPosY )
    local nIndex = hud.getUnderCursorListItem ( hUser )
    --local sName = hud.getCom
    
    local hTextures = this.tTextureTable ( )
    
    
    local nModID = sName
       log.message ("In SelectObject : User clicked: ", nModID,  "      Got name: ", sName  )
       this.sListSelection ( ""..sName )
       this.nModelID( nModID ) 
   
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------