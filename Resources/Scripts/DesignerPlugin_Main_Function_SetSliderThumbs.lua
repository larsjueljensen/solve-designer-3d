--------------------------------------------------------------------------------
--  Function......... : SetSliderThumbs
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DesignerPlugin_Main.SetSliderThumbs ( sArticleNumber )
--------------------------------------------------------------------------------
	this.LogToWeb ( "Set sliderthumbs" )
	    local hUser = application.getCurrentUser ( )
        local hSlider = user.getAIVariable ( this.getUser ( ), "ASPMain", "hSliderObject" )
    
--     local nCat = 0--nCatCode
--     
--     local hObj = user.getAIVariable ( hUser,"MovingObject", "hSelectedObject" )
--     local tTable0 = this.tCabinets ( )
--     local tTable1 = this.tFronts ( )
--     local tTable2 = this.tSliding ( )
--     local tTable3 = this.tStorage ( )    
--     local tTable4 = this.tShelving ( )
--     local tTable5 = this.tAccessories ( )    
--     local tTableCategory = this.tCatCombi( )
--     local tTable = this.tCatCombi()
--     local nMode = this.nSliderMode ( )
-- 
-- 
if sArticleNumber ~= nil then
    object.sendEvent ( hSlider , "Slider", "onAddThumbnail", sArticleNumber )


end

return true

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
