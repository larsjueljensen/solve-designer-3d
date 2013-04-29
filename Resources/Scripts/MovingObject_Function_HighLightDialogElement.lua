--------------------------------------------------------------------------------
--  Function......... : HighLightDialogElement
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.HighLightDialogElement ( n )
--------------------------------------------------------------------------------
	
	--Value sent from button    
local hUser = application.getCurrentUser( )

local hElement = hud.getUnderCursorComponent ( hUser )
local hContainer = hud.getComponentContainer ( hElement )

if n == 0 and hElement then --button touch.
--highlight bg/text

hud.setComponentBackgroundColor ( hElement, 60,80,127,255 )

elseif n == 1 then

--turn off highlight.
hud.setComponentBackgroundColor ( hElement, 50,50,50,255 )
hud.setComponentVisible ( hElement, false )


end



	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
