--------------------------------------------------------------------------------
--  Function......... : LogToWeb
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.LogToWeb ( sLogStatement )
--------------------------------------------------------------------------------
	
	    system.openURL ( 'javascript:onPluginLog("'..sLogStatement..'");', '' )

	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
