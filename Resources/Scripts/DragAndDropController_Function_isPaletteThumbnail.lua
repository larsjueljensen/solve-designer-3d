--------------------------------------------------------------------------------
--  Function......... : isPaletteThumbnail
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.isPaletteThumbnail ( hComponent )
--------------------------------------------------------------------------------

    if ( hud.getComponentType ( hComponent ) == hud.kComponentTypeButton ) then

        local sTag = hud.getComponentTag ( hComponent )

        if ( string.contains ( sTag, "Thumbnail" ) ) then
            return not string.contains( sTag, "Info" )
        end

    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
