--------------------------------------------------------------------------------
--  Handler.......... : onCreateSceneObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlReader.onCreateSceneObject ( sArticleNumber, trX, trY, trZ, rX, rY, rZ )
--------------------------------------------------------------------------------

    local sFilename = sArticleNumber..".stk" 
    local nFileStatus = cache.getFileStatus ( sFilename )
    
    if nFileStatus == 1 then
        
        this.createSceneObject ( sArticleNumber, trX, trY, trZ, rX, rY, rZ )
        
    elseif nFileStatus < 0 and nFileStatus > -2 then
    
        local sURL = this.buildObjectURL ( sArticleNumber )
        cache.addFile ( sFilename , sURL )
        this.postEvent ( 0, "onCreateSceneObject", sArticleNumber, trX, trY, trZ, rX, rY, rZ ) 
    
    elseif nFileStatus < 1 and nFileStatus > -2 then
    
        this.postEvent ( 0, "onCreateSceneObject", sArticleNumber, trX, trY, trZ, rX, rY, rZ )         
    
    else
        
        this.LogToWeb ( "Error loading file: "..sFilename )

    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
