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
    
	--Check for undercursor object or hudcomponent
    --
    --**************************************
    --States:                              
    -- 0 = nothing under cursor.           
    -- 1 = Wall 1 under cursor.            
    -- 2 = Wall 2 under cursor.
    -- 3 = Wall 3 under cursor.
    -- 4 = Wall 4 under cursor.
    -- 5 = 3D Object under cursor.
    -- 6
    -- .......
    --*************************************
    
    local hUnderCursorComponent = hud.getUnderCursorComponent ( hUser )
    
    this.bThumbzone ( false )
    user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
    user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )

    if hUnderCursorComponent then
    --Cursor is not in scene. Get component type.
    --
        if ( hud.getComponentType ( hUnderCursorComponent ) == hud.kComponentTypeButton )then    
        elseif ( hud.getComponentType ( hUnderCursorComponent ) == hud.kComponentTypeContainer )then 
        end
    
    else 
    --Cursor is in scene.Get object type by sensorcategory.
        local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )


        if hHitObject then
        log.message( "Mouse up hHitObject: ", hHitObject )
        this.hObjectHit( hHitObject )
        
        local sHitTag = scene.getObjectTag ( hScene, hHitObject )
        
        log.message ( "In Scene: ", sHitTag )
        
        if string.compare ( "Floor", sHitTag ) == 0 then
        
        this.CursorState ( 0 )
        log.message ( "Hit floor" )
        
        elseif string.compare ( "Wall1", sHitTag ) == 0 then
        
        this.CursorState ( 2 )
        log.message ( "Hit wall Front" )
        
        elseif string.compare ( "Wall2", sHitTag ) == 0 then

        this.CursorState ( 1 )
        log.message ( "Hit wall left" )

        elseif string.compare ( "Wall3", sHitTag ) == 0 then

        this.CursorState ( 3 )
        log.message ( "Hit wall right" )
        
        else
        
        this.CursorState( 4 )
        log.message ( "Hit 3d object" )

        
        
        
        end
        
        --Check sensorcategory
        --
        
        
        --local nType = sensor.getCategoryBitAt ( hObject, 0, 1 )
    end

    local nState = this.CursorState ( )
    local bSelection = user.getAIVariable( this.getUser() , "MovingObject", "bListSelection")

    log.message ( "Sending CursorState: ", this.CursorState ( ) )
    log.message( user.getAIVariable( this.getUser() , "MovingObject", "bListSelection") ) 
        if nState == 0 then
            if bSelection == true 
            then
            user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState )
            end
            
        elseif nState == 1 then
        
            if bSelection == true 
            then
            user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState )
            end
        
        elseif nState == 2 then
        
        
            if bSelection == true 
            then
            user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( ), nPointX )
            end
        
        
        elseif nState == 3 then
        
            if bSelection == true 
            then
            user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( ) )
            end
        
        elseif nState == 4 then
        
            if bSelection == true 
            then
            user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( )  )
            end

        
        end

    this.CursorState( 0 )

	end
    
    --log.message ( nPointX, "  ", nPointY  )	
    
    user.setAIVariable ( hUser, "ASPMain", "bWheelUsed",  false )
    
--     local hUser = application.getCurrentUser ( )
--     local hScene = application.getCurrentUserScene ( )
--     
-- 	--Check for undercursor object or hudcomponent
--     --
--     --**************************************
--     --States:                              
--     -- 0 = nothing under cursor.           
--     -- 1 = Wall 1 under cursor.            
--     -- 2 = Wall 2 under cursor.
--     -- 3 = Wall 3 under cursor.
--     -- 4 = Wall 4 under cursor.
--     -- 5 = 3D Object under cursor.
--     -- 6
--     -- .......
--     --*************************************
--     
--     local hUnderCursorComponent = hud.getUnderCursorComponent ( hUser )
--     
--     this.bThumbzone ( false )
--     user.sendEvent ( hUser, "SliderEvents","onArrowRight", "MySlider", false )
--     user.sendEvent ( hUser, "SliderEvents","onArrowLeft", "MySlider", false )
-- 
--     if hUnderCursorComponent then
--     --Cursor is not in scene. Get component type.
--     --
--         if ( hud.getComponentType ( hUnderCursorComponent ) == hud.kComponentTypeButton )then    
--         
--         --Component is type button
--         --
--         
--         --log.message ( "Type is button " )
--         
--         elseif ( hud.getComponentType ( hUnderCursorComponent ) == hud.kComponentTypeContainer )then 
--         
--         --log.message ( "Type is Container " )
--         
--         end
--     
--     else 
--     --Cursor is in scene.Get object type by sensorcategory.
--         local hHitObject,nHitDist,nHitID = scene.getFirstHitSensor (hScene,nRayPntX, nRayPntY, nRayPntZ, nRayDirX, nRayDirY, nRayDirZ, 3500 )
-- 
-- 
--         if hHitObject then
--         log.message( "Mouse up hHitObject: ", hHitObject )
--         this.hObjectHit( hHitObject )
--         
--         local sHitTag = scene.getObjectTag ( hScene, hHitObject )
--         
--         log.message ( "In Scene: ", sHitTag )
--         
--         if string.compare ( "Floor", sHitTag ) == 0 then
--         
--         this.CursorState ( 0 )
--         
--         elseif string.compare ( "Wall1", sHitTag ) == 0 then
--         
--         this.CursorState ( 1 )
--         log.message ( "Hit wall Right" )
--         
--         elseif string.compare ( "Wall2", sHitTag ) == 0 then
-- 
--         this.CursorState ( 2 )
--         log.message ( "Hit wall Front" )
-- 
--         elseif string.compare ( "Wall3", sHitTag ) == 0 then
-- 
--         this.CursorState ( 3 )
--         log.message ( "Hit wall left" )
--         
--         else
--         
--         this.CursorState( 4 )
--         log.message ( "Hit 3d object" )
--         end
--     end
-- 
--     local nState = this.CursorState ( )
--     local bSelection = user.getAIVariable( this.getUser() , "MovingObject", "bListSelection")
-- 
--     log.message ( "Sending CursorState: ", this.CursorState ( ) )
--     
--         if nState == 0 then
--             if bSelection == true 
--             then
--             user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState )
--             end
--             
--         elseif nState == 1 then
--         
--             if bSelection == true 
--             then
--             user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState )
--             end
--         
--         elseif nState == 2 then
--         
--         
--             if bSelection == true 
--             then
--             user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( ), nPointX )
--             end
--         
--         
--         elseif nState == 3 then
--         
--             if bSelection == true 
--             then
--             user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( ) )
--             end
--         
--         elseif nState == 4 then
--         
--             if bSelection == true 
--             then
--             user.sendEventImmediate ( this.getUser ( ), "MovingObject", "onSetObject", nState, this.TopNode ( )  )
--             end
-- 
--         
--         end
-- 
--     this.CursorState( 0 )
-- 
-- 	end
--     
--     log.message ( nPointX, "  ", nPointY  )
-- --------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
