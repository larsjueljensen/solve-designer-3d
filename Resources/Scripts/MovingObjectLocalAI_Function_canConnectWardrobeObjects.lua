--------------------------------------------------------------------------------
--  Function......... : canConnectWardrobeObjects
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectLocalAI.canConnectWardrobeObjects ( hWardrobeObjectA, hWardrobeObjectB )
--------------------------------------------------------------------------------

    local sArticleNumberA = object.getAIVariable ( hWardrobeObjectA, "CommonObjectProperties", "articleNumber" )
    local sArticleNumberB = object.getAIVariable ( hWardrobeObjectB, "CommonObjectProperties", "articleNumber" )
    
    return this.canConnectArticles ( sArticleNumberA, sArticleNumberB )
		
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
