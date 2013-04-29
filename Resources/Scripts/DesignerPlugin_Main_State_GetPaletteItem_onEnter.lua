--------------------------------------------------------------------------------
--  State............ : GetPaletteItem
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.GetPaletteItem_onEnter ( )
--------------------------------------------------------------------------------
	
    
    local sArticleNumber = this.sCurrentArticleNumber ( )
    local sURL = this.buildPaletteItemURL ( sArticleNumber )
	local sFilename = sArticleNumber..".jpg"
    this.LogToWeb ( "GetPaletteItem_onEnter - "..sURL ) 
     if ( cache.getFileStatus ( sFilename ) < 0 ) then
        cache.addFile ( sFilename, sURL )
     else     
        this.Idle ( )
     end   
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
