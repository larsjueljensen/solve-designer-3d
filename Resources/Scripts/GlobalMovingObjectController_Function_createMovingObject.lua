--------------------------------------------------------------------------------
--  Function......... : createMovingObject
--  Author........... : Lars Juel Jensen
--  Description...... : Creates a moving object helper
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  Param hHelperObject........: Either a wardrobe object or a wardrobe group object 
--  Param sType................: The type of the moving object helper to create. Can be "Local" or "Global"
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function GlobalMovingObjectController.createMovingObject ( hHelperObject, sType )
--------------------------------------------------------------------------------

    -- Create the moving object helper based on the given type (Global or Local)
    local hMovingObject = scene.createRuntimeObject ( application.getCurrentUserScene ( ), "MovingObject"..sType )
        
    object.matchTranslation ( hMovingObject, hHelperObject, object.kGlobalSpace )
    object.matchRotation ( hMovingObject, hHelperObject, object.kGlobalSpace )
    
    -- If it is a "Local" moving object (ie. moving a shelf or drawer within a hull)
    if string.compare ( "Local", sType ) == 0 then
    
        -- Get the parent of the given helper object 
        -- (helper object will only be wardrobe object for type "Local")
        local hHelperParent = object.getParent ( hHelperObject )
        
        -- Set the new moving object's parent to the wardrobe object's parent
        object.setParent ( hMovingObject, hHelperParent, true )
    end
 
    -- Set the helper object's (wardrobe / wardrobe group) parent to the new moving object helper
    -- This will ensure that the entire wardrobe object (or group) will be controlled by the moving object helper
    object.setParent ( hHelperObject, hMovingObject, true )
    
    -- Add a behavioural model to moving object helper that corresponds to it's type
    -- (ie. A hull (global) object has different kinds of restrictions than a drawer (local) )
    local aiModelName = "MovingObject"..sType.."AI"
    object.addAIModel ( hMovingObject, aiModelName )
    this.transferAIVariable ( hMovingObject, aiModelName, hHelperObject, "CommonObjectProperties", "objectWidth" )
    this.transferAIVariable ( hMovingObject, aiModelName, hHelperObject, "CommonObjectProperties", "objectHeight" )
    this.transferAIVariable ( hMovingObject, aiModelName, hHelperObject, "CommonObjectProperties", "objectDepth" )
    
    this.setObjectOpacity ( hMovingObject, 0.8 )
    object.sendEvent ( hHelperObject, "HighlightObjectAI", "onHighlight", true )

    -- Save a handle to the objects in play so that we can remove the moving helper object correctly later
    this.hHelperObject ( hHelperObject )
    this.hMovingObject ( hMovingObject )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
