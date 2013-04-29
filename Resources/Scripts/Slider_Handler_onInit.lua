--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.onInit (  )
--------------------------------------------------------------------------------
	
log.message (  "INIT create slidehud." ) 

--local hObject = user.getAIVariable ( application.getCurrentUser ( ), "aspmenu_AI", "hSliderObject")
--

local sSlider = this.sSliderName ( )

hud.newTemplateInstance ( application.getCurrentUser ( ), "Slider_HUD", this.sSliderName ( ))
local hTest = hud.getComponent ( application.getCurrentUser ( ), "Slider.Thumbnail_Container" )
log.message ( hTest )
--object.sendEvent ( hObject, "Slider", "onCreate", "Slider", this.sSliderName ( )..".Slide_Container" ) 
--local test = hud.getComponent ( application.getCurrentUser(), this.sSliderName.."LowMenuHolder" )	
-- 
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
