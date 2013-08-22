--------------------------------------------------------------------------------
--  Function......... : canConnectWardrobeObjects
--  Author........... : Lars Juel Jensen
--  Description...... : Checks if given wardrobe objects can be connected
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.canConnectWardrobeObjects ( hWardrobeObjectA, hWardrobeObjectB )
--------------------------------------------------------------------------------

    local sArticleNumberA = object.getAIVariable ( hWardrobeObjectA, "CommonObjectProperties", "articleNumber" )
    local sArticleNumberB = object.getAIVariable ( hWardrobeObjectB, "CommonObjectProperties", "articleNumber" )
    
    return this.canConnectArticles ( sArticleNumberA, sArticleNumberB )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
