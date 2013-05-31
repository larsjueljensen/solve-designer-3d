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
    local hTextures = this.tTextureTable ( )
    local nModID = sName

    this.sListSelection ( ""..sName )
    this.nModelID( nModID ) 

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
