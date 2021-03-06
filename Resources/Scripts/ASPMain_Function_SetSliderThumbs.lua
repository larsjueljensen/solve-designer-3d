--------------------------------------------------------------------------------
--  Function......... : SetSliderThumbs
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.SetSliderThumbs (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    local nCat = 0--nCatCode
    
    local hObj = user.getAIVariable ( hUser,"MovingObject", "hSelectedObject" )
    local tTable0 = this.tCabinets ( )
    local tTable1 = this.tFronts ( )
    local tTable2 = this.tSliding ( )
    local tTable3 = this.tStorage ( )    
    local tTable4 = this.tShelving ( )
    local tTable5 = this.tAccessories ( )    
    local tTableCategory = this.tCatCombi( )
    local tTable = this.tCatCombi()
    local nMode = this.nSliderMode ( )


if tTable ~= nil then

    local nThumbs = table.getSize ( this.tCatCombi( ) )
    local hSlider = this.hSliderObject ( )
    for i = 0, nThumbs-1
      do      
      object.sendEvent ( hSlider , "Slider", "onAddThumbnail" )
    end
else

end
return true

	
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
