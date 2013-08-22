--------------------------------------------------------------------------------
--  Function......... : Preload
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ASPMain.Preload ( )
--------------------------------------------------------------------------------
	local hScene = application.getCurrentUserScene ( )
    local hNewSlider0 = scene.createRuntimeObject ( hScene, "SliderObject" )
    scene.setRuntimeObjectTag ( hScene, hNewSlider0, "Slider" ) 
    this.hSliderObject( hNewSlider0 )
    this.CreateRoom ( )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
