--------------------------------------------------------------------------------
--  Handler.......... : onSetObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onSetObject ( nState , hParent, nPointX )
--------------------------------------------------------------------------------
    
    log.message ( "onSetObject, received: ", nState, " and ", "hParent: ", hParent )
    log.message ( nPointX )
    
    --get target translation
    --
    
    if this.bListSelection ( ) == true 
    then
    this.CreateObject (  )
    
    this.SetModel ( nState, hParent, nPointX )
    else
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
