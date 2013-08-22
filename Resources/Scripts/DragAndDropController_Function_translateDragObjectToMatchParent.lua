--------------------------------------------------------------------------------
--  Function......... : translateDragObjectToMatchParent
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.translateDragObjectToMatchParent ( hDragObject, ypos )
--------------------------------------------------------------------------------

    local hParent = this.getWardrobeObject( object.getParent ( hDragObject ) )
    local x, y, z = object.getTranslation ( hParent, object.kGlobalSpace )
    
    local parentHeight = object.getAIVariable ( hParent, "CommonObjectProperties", "objectHeight" )
    local dragObjectHeight = this.objectHeight ( )
    
    if ( ypos > parentHeight - dragObjectHeight ) then
        ypos =  parentHeight - dragObjectHeight
    end
    
    if ( ypos < 0.875 ) then
        ypos = 0.875
    end

    object.setTranslation ( hDragObject, x, ypos, z, object.kGlobalSpace )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
