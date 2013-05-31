--------------------------------------------------------------------------------
--  Handler.......... : onLoadModel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.onLoadModel ( sArticleNumber )
--------------------------------------------------------------------------------
   
    local sFilename = sArticleNumber..".stk" 
    local nFileStatus = cache.getFileStatus ( sFilename )
    
    
    if nFileStatus == 1 then
        
        this.LogToWeb ( "File found in cache: "..sFilename )
        this.LogToWeb ( "Adding to palette: "..sArticleNumber )
        --this.SetSliderThumbs ( sArticleNumber )
        
        local hSlider = user.getAIVariable ( this.getUser ( ), "ASPMain", "hSliderObject")
        this.LogToWeb ( "Slider: " )
        object.sendEvent ( hSlider, "Slider", "onAddThumbnail", sArticleNumber )
        
    elseif nFileStatus < 0 and nFileStatus > -2 then
        
        local sURL = this.buildObjectURL ( sArticleNumber )
        this.LogToWeb ( "File not found in cache: "..sFilename )
        this.LogToWeb ( "Adding file to cache with url: "..sURL )

        cache.addFile ( sFilename , sURL )
        this.postEvent ( 0, "onLoadModel", sArticleNumber ) 
    
    elseif nFileStatus < 1 and nFileStatus > -2 then

        this.postEvent ( 0, "onLoadModel", sArticleNumber ) 
        
    else
    
        this.LogToWeb ( "Error loading file: "..sFilename )

    end

------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
