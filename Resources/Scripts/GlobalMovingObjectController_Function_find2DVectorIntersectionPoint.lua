--------------------------------------------------------------------------------
--  Function......... : find2DVectorIntersectionPoint
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.find2DVectorIntersectionPoint ( aposx, aposy, adirx, adiry, bposx, bposy, bdirx, bdiry )
--------------------------------------------------------------------------------
	
    -- t = (q - p) × s / (r × s)
    -- u = (q - p) × r / (r × s)
    
    -- q = [bposx, bposy]
    -- p = [aposx, aposy]
    -- r = [adirx, adiry]
    -- s = [bdirx, bdiry]
    
    local scalar = this.crossProduct2DVector ( adirx, adiry, bdirx, bdiry )

    if (scalar == 0) then
        return 0, 0
    end
    
    local x = this.crossProduct2DVector ( bposx - aposx, bposy - aposy, bdirx, bdiry ) / scalar
    local y = this.crossProduct2DVector ( bposx - aposx, bposy - aposy, adirx, adiry ) / scalar
    
    return x, y
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
