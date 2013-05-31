--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function RuleMouseController.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    this.handleMouseEvent ( "onHandleMouseUp", nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
