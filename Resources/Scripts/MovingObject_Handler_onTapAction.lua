--------------------------------------------------------------------------------
--  Handler.......... : onTapAction
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.onTapAction ( nTapTime, nCount, nButton )
--------------------------------------------------------------------------------
	--log.message ( "In fnc onTapAction" )
    
    local hIsHUD = hud.getUnderCursorComponent ( this.getUser ( ) )
    
    if ( this.nLatestTapTime ( ) == nTapTime )
    then
      log.warning ( nCount )
          if ( nCount == 1 )
          then
            --Single tap script
            
            if hIsHUD == nil then
            this.SingleTap ( )
            else
            end
            
        elseif ( nCount == 2 ) and hIsHUD == nil
        then
          --Double tap script
         
          this.DoubleTap ( )
          
        elseif ( nCount == 3 )
        then
          --And more...
          --log.message ( "Calling fnc TripleTap" )
          --this.TripleTap ( )
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
