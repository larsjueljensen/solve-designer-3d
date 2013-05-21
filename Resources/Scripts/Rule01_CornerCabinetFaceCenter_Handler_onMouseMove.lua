--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Rule01_CornerCabinetFaceCenter.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    log.message ( "sX:"..nPointX );
    log.message ( "sY:"..nPointY );

    log.message ( "dX:"..nDeltaX );
    log.message ( "dY:"..nDeltaY );

    log.message ( "rX:"..nRayPntX );
    log.message ( "rY:"..nRayPntY );
    log.message ( "rZ:"..nRayPntZ );

    log.message ( "dX:"..nRayDirX );
    log.message ( "dY:"..nRayDirY );
    log.message ( "dZ:"..nRayDirZ );
    

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
