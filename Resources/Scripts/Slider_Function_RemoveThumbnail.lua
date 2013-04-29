--------------------------------------------------------------------------------
--  Function......... : RemoveThumbnail
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.RemoveThumbnail ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
	local hThumbnail_Container = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".Thumbnail_Container" )
    --log.message ( "Got container" )
    
    
    
if hThumbnail_Container then
    local nThumbnails = hud.getContainerChildCount ( hThumbnail_Container )
    
    local hComponent
    local htHashtable = this.aThumbnail ( )
    local htHashtableInfo = this.aThumbnail1 ( )
  
    --local hSlider = hud.getComponent( application.getCurrentUser ( ), "MySlider" )
    
    --log.message ( "Removing ", nThumbnails, " thumbnails." )
    local n = hashtable.getSize ( htHashtable )
    local nInfo = hashtable.getSize ( htHashtableInfo )
    
    
    for i = 0, n - 1 do
    
        local hAction = hud.getAction ( application.getCurrentUser ( ), this.sSliderName ( ).."ThumbnailClickedAction0"..i )
        local hActionInfo = hud.getAction ( application.getCurrentUser ( ), this.sSliderName ( ).."ThumbnailInfoClickedAction"..i )

        if hAction then
        --log.warning( "Got button action: ", hAction )
        hud.destroyAction ( hAction )
        end
        
        if hActionInfo then
        --log.warning( "Got Infobutton action: ", hActionInfo )
        hud.destroyAction ( hActionInfo )
        end

        
    local sTag = hashtable.getKeyAt ( htHashtable, i )
    local sTagInfo = hashtable.getKeyAt ( htHashtableInfo, i )

    --local hComponent = hud.getComponent ( hUser, sTag )
    
    --log.warning ( "sTag(sKey) = ", sTag )
    
    local sValue = hashtable.getAt ( htHashtable, i )

    local sValueInfo = hashtable.getAt ( htHashtableInfo, i )

    --log.warning ( "sValue(value) = ", sValue )
    
    local hComponent = hud.getComponent ( hUser, sTag )
    local hComponentInfo = hud.getComponent ( hUser, sTagInfo )

    --log.warning ( "hComponent = ", hComponent )

    hud.destroyComponent ( hComponent  )
    hud.destroyComponent ( hComponentInfo )
    local nCount = hud.getActionCount ( hUser)
    
    --log.warning ( "actioncount MySlider =", nCount )
    
    
    end
    
         hashtable.empty ( this.aThumbnail ( ) )
         hashtable.empty ( this.aThumbnail1 ( ) )
    
    --hud.destroyTemplateInstance ( hUser, this.sSliderName ( ) )
    
    --hud.getAction (  )
--             if ( hashtable.contains ( htHashtable, sKey ) )
--             then
--                -- If the key is in the hashtable, update the value
--                hashtable.set ( htHashtable, sKey, vValue )
--             else
--                -- If the key is not in the hashtable, create a new entry in the hashtable, with sKey and vValue as key/value for this entry.
--                hashtable.add ( htHashtable, sKey, vValue )
--             end
--     
    for i = 0, nThumbnails - 1 do
     hComponent = hud.getContainerChildAt ( hThumbnail_Container, i )
     
     --log.warning ( "hComponent = ", hComponent )
    
    
    end
    
--     for i = 0, nThumbnails - 1 do
--     
--     local hComponent = hud.getContainerChildAt ( hThumbnail_Container, i )
--     
--     local hThumbTag = hud.getComponentTag ( hComponent )
--     table.add ( this.htThumbsDeleteTable (  ), hThumbTag )
--     
--     
--     
--     log.warning ( hThumbnail_Container, "  ", hComponent )
--     --log,warning(  )
--     if hComponent then
--     local hThumb = table.getAt ( this.htThumbsDeleteTable ( ), i )
--     local hThumbnail = hud.getComponent ( hUser, hThumb )
--     --hud.destroyComponent ( hThumbnail )
--     
--     
--     nThumbnails = hud.getContainerChildCount ( hThumbnail_Container )
--     
--     
--     log.message ( "Destroyed thumbnail ", i, " ", hThumbnail )
--     log.warning( " thumbnails left to destroy: ", nThumbnails )
--     end
--     end
     --clean hashtable
     --hashtable.empty ( this.aThumbnail ( ) )
-- 
end	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
