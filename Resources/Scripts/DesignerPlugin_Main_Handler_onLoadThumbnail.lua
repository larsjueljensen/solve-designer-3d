--------------------------------------------------------------------------------
--  Handler.......... : onLoadThumbnail
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onLoadThumbnail ( sArticleNumber )
--------------------------------------------------------------------------------

    local sFilename = sArticleNumber..".jpg" 
    local nFileStatus = cache.getFileStatus ( sFilename )

    if nFileStatus == 1 then

        this.LogToWeb ( "File found in cache: "..sFilename )
        this.postEvent ( 0, "onLoadModel", sArticleNumber  )

    elseif nFileStatus < 0 and nFileStatus > -2 then

        local sURL = this.buildPaletteItemURL ( sArticleNumber )
        this.LogToWeb ( "File not found in cache: "..sFilename )
        this.LogToWeb ( "Adding file to cache with url: "..sURL )

        cache.addFile ( sFilename , sURL )
        this.postEvent ( 0, "onLoadThumbnail", sArticleNumber ) 

    elseif nFileStatus < 1 and nFileStatus > -2 then
        
        this.postEvent ( 0, "onLoadThumbnail", sArticleNumber ) 

    else
    
        this.LogToWeb ( "Error loading file: "..sFilename )

    end

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
