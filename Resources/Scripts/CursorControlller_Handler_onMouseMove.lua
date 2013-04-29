--------------------------------------------------------------------------------
--  Handler.......... : onMouseMove
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function CursorControlller.onMouseMove ( nPointX, nPointY, nDeltaX, nDeltaY, nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ )
--------------------------------------------------------------------------------
	
local hUser = application.getCurrentUser ( )
    local hScene = application.getCurrentUserScene ( )
    
	--Check for undercursor object or hudcomponent
    --
    --**************************************
    --States:                              
    -- 0 = Floor under cursor.           
    -- 1 = Wall 1 under cursor.            
    -- 2 = Wall 2 under cursor.
    -- 3 = Wall 3 under cursor.
    -- 4 = 3D Object under cursor.
    -- 5 =.
    -- 6
    -- .......
    --*************************************
    
    local hUnderCursorComponent = hud.getUnderCursorComponent ( hUser )
    

    if hUnderCursorComponent then
    --Cursor is not in scene. Get component type.
    --
        if ( hud.getComponentType ( hUnderCursorComponent ) == hud.kComponentTypeButton )then    
        
        --Component is type button
        --
        
        --log.message ( "Type is button " )
        
        elseif ( hud.getComponentType ( hUnderCursorComponent ) == hud.kComponentTypeContainer )then 
        
        --log.message ( "Type is Container " )
        
        end
    
    else 
    --Cursor is in scene.Get object type by sensorcategory.
        local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )

        if hHitObject then
            local nBoundingXmin, nBoundingYmin, nBoundingZmin = object.getBoundingBoxMin ( hHitObject )
            local nBoundingXmax, nBoundingYmax, nBoundingZmax = object.getBoundingBoxMin ( hHitObject )

            local sHitTag = scene.getObjectTag ( hScene, hHitObject )
            local nMode
            --log.message ( "In Scene Cursor hit: ", sHitTag)
            
            local bSensorType = sensor.getCategoryBitAt ( hHitObject, 0 , 4 )
            local bSensorTypeAddon = sensor.getCategoryBitAt ( hHitObject, 0 , 5 )

        --Check sensorcategory
        --

            if bSensorType == true then
                    this.CursorState ( 4 )
                
                    --log.message ( "On parent object" )
                    --log.message ( "hHitObject = ", hHitObject )
                    if bSensorTypeAddon == true then
                    user.sendEvent ( hUser, "MovingObject", "onHighlightObject", hHitObject, hHitObject, 0 )
                    else
                    local hTopNode = this.GetTopNode ( hHitObject )
                    this.TopNode ( hTopNode )
                    user.sendEvent ( hUser, "MovingObject", "onHighlightObject", hHitObject, hTopNode, 0 )  
                    end
           else 
                    --user.sendEvent ( hUser, "MovingObject", "onHighlightObject", hHitObject, this.hHighlightedObject(), 1 )
                    
                    hTopNode = hHitObject
                    
                    user.sendEventImmediate ( hUser, "MovingObject", "onHighlightObject", hHitObject, hTopNode, 1 )
            end
        else
        end
    
    end
    
    local sSliderName = user.getAIVariable ( hUser, "SliderEventt", "sSliderName" )
    --log.message( "sSliderName", sSliderName )
    
    
        if nPointY <= -0.45 and nPointY >= -0.90 then
                if nPointX < -0.25 then
                --update slider left  
                user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", true )
                --user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )

                --log.message ( "In the zone!!" )
                elseif nPointX > 0.25 then
                user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", true )
                --user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )
                else
                user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
                user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )
                end
                local CursorPos = user.setAIVariable ( this.getUser ( ), "Slider", "CursorPos, ", nPointX )

                
                this.bThumbzone ( true )
        else 
            user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
            user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )
        
        this.bThumbzone ( false )
        end
    
    
    
------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
