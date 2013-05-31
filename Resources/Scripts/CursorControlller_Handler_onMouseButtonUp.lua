--------------------------------------------------------------------------------
--  Handler.......... : onMouseButtonUp
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.onMouseButtonUp ( nButton, nPointX, nPointY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------

    local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    local hUnderCursorComponent = hud.getUnderCursorComponent ( hUser )
    
    this.bThumbzone ( false )
    user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
    user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )

    if hUnderCursorComponent == nil then

        local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )

        if hHitObject then

            local sHitTag = scene.getObjectTag ( hScene, hHitObject )
            this.hObjectHit( hHitObject )            
        
            if string.compare ( "Floor", sHitTag ) == 0 then
                this.CursorState ( 0 )
            elseif string.compare ( "Wall1", sHitTag ) == 0 then
                this.CursorState ( 2 )
            elseif string.compare ( "Wall2", sHitTag ) == 0 then
                this.CursorState ( 1 )
            elseif string.compare ( "Wall3", sHitTag ) == 0 then
                this.CursorState ( 3 )
            else
                this.CursorState( 4 )
            end
        end

        local nState = this.CursorState ( )
        local bSelection = user.getAIVariable( this.getUser() , "MovingObject", "bListSelection")
        
        if bSelection == true then
            if nState == 0 then
                user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState )
            elseif nState == 1 then
                user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState )
            elseif nState == 2 then
                user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( ), nPointX )
            elseif nState == 3 then
                user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( ) )
            elseif nState == 4 then
                user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( ) )
            end
        end

        this.CursorState( 0 )

	end
        
    user.setAIVariable ( hUser, "ASPMain", "bWheelUsed",  false )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
