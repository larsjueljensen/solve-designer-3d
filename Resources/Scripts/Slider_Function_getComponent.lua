--------------------------------------------------------------------------------
--  Function......... : getComponent
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.getComponent ( sName )
--------------------------------------------------------------------------------

    return hud.getComponent ( application.getCurrentUser ( ), this.sSliderName ( ) .. "." .. sName )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------