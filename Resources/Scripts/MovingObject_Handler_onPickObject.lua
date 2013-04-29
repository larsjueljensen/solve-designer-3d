--------------------------------------------------------------------------------
--  Handler.......... : onPickObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onPickObject (  )
--------------------------------------------------------------------------------
	
    local hClicked  = hud.getUnderCursorComponent (  this.getUser ( ))
    
    if hClicked then
    local sThumb = hud.getComponentBackgroundImageName ( hClicked )
    this.SelectObject ( sThumb )
	this.bListSelection( true )
    this.ShowTarget (  )
    
    else
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
