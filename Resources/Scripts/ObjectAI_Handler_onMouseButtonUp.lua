--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    user.setAIVariable ( this.getUser ( ), "MovingObject", "hMovingObject", false )
    this.hMovingObject( nil )
    this.bIsMovingObject ( false )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
