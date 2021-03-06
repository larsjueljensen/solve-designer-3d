--------------------------------------------------------------------------------
--  Handler.......... : onCreate
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.onCreate ( sName, sContainer )
--------------------------------------------------------------------------------
	
	this.sSliderName ( sName )
    
    local hContainer = hud.getComponent ( application.getCurrentUser ( ), sContainer )
    if ( hContainer ~= nil ) then
        local hSlider = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".Slide_Container" )
        if ( hSlider ) 
        then
            hud.setComponentOrigin          ( hSlider, hud.kOriginCenter )
            hud.setComponentPosition        ( hSlider, 50, 50 )  
            hud.setComponentSize            ( hSlider, 100, 100 )        
            hud.setComponentContainer       ( hSlider, hContainer )        
        end
    end
    
    --create arrow actions
    local hLeftArrow = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".ArrowLeft" )
    if ( hLeftArrow) then
        local hLeftArrowClic = hud.newAction ( application.getCurrentUser ( ), this.sSliderName ( ).."LeftArrowClick" )
        if ( hLeftArrowClic ) then        
            hud.beginActionCommand          ( hLeftArrowClic, hud.kCommandTypeSendEventToUser ) 
            hud.pushActionCommandArgument   ( hLeftArrowClic, application.getCurrentUser ( ) )
            hud.pushActionCommandArgument   ( hLeftArrowClic, "SliderEvents" )
            hud.pushActionCommandArgument   ( hLeftArrowClic, "onArrowLeft" )
            hud.pushActionCommandArgument   ( hLeftArrowClic, this.sSliderName ( ) )
            hud.pushActionCommandArgument   ( hLeftArrowClic, true )
            hud.endActionCommand            ( hLeftArrowClic )          
            hud.setButtonOnClickAction      ( hLeftArrow, hLeftArrowClic )
        end
        local hLeftArrowClicked = hud.newAction ( application.getCurrentUser ( ), this.sSliderName ( ).."LeftArrowClicked" )
        if ( hLeftArrowClicked ) then        
            hud.beginActionCommand          ( hLeftArrowClicked, hud.kCommandTypeSendEventToUser ) 
            hud.pushActionCommandArgument   ( hLeftArrowClicked, application.getCurrentUser ( ) )
            hud.pushActionCommandArgument   ( hLeftArrowClicked, "SliderEvents" )
            hud.pushActionCommandArgument   ( hLeftArrowClicked, "onArrowLeft" )
            hud.pushActionCommandArgument   ( hLeftArrowClicked, this.sSliderName ( ) )
            hud.pushActionCommandArgument   ( hLeftArrowClicked, false )
            hud.endActionCommand            ( hLeftArrowClicked )          
            hud.setButtonOnClickedAction    ( hLeftArrow, hLeftArrowClicked )
        end
    end
	
    local hRightArrow = hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( )..".ArrowRight" )
    if ( hRightArrow) then
        local hRightArrowClic = hud.newAction ( application.getCurrentUser ( ), this.sSliderName ( ).."RightArrowClick" )
        if ( hRightArrowClic ) then        
            hud.beginActionCommand          ( hRightArrowClic, hud.kCommandTypeSendEventToUser ) 
            hud.pushActionCommandArgument   ( hRightArrowClic, application.getCurrentUser ( ) )
            hud.pushActionCommandArgument   ( hRightArrowClic, "SliderEvents" )
            hud.pushActionCommandArgument   ( hRightArrowClic, "onArrowRight" )
            hud.pushActionCommandArgument   ( hRightArrowClic, this.sSliderName ( ) )
            hud.pushActionCommandArgument   ( hRightArrowClic, true )
            hud.endActionCommand            ( hRightArrowClic )          
            hud.setButtonOnClickAction      ( hRightArrow, hRightArrowClic )
        end
        local hRightArrowClicked = hud.newAction ( application.getCurrentUser ( ), this.sSliderName ( ).."RightArrowClicked" )
        if ( hRightArrowClicked ) then        
            hud.beginActionCommand          ( hRightArrowClicked, hud.kCommandTypeSendEventToUser ) 
            hud.pushActionCommandArgument   ( hRightArrowClicked, application.getCurrentUser ( ) )
            hud.pushActionCommandArgument   ( hRightArrowClicked, "SliderEvents" )
            hud.pushActionCommandArgument   ( hRightArrowClicked, "onArrowRight" )
            hud.pushActionCommandArgument   ( hRightArrowClicked, this.sSliderName ( ) )
            hud.pushActionCommandArgument   ( hRightArrowClicked, false )
            hud.endActionCommand            ( hRightArrowClicked )          
            hud.setButtonOnClickedAction    ( hRightArrow, hRightArrowClicked )
        end
    end
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
