--------------------------------------------------------------------------------
--  Function......... : canConnectArticles
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObjectLocalAI.canConnectArticles ( sArticleNumberA, sArticleNumberB )
--------------------------------------------------------------------------------

    local hCategoriesA = this.getCouplingCategories ( sArticleNumberA )
    local hCategoriesB = this.getCouplingCategories ( sArticleNumberB )
    
    for i = 0, table.getSize ( hCategoriesA ) - 1 do
        local sCategory = table.getAt ( hCategoriesA, i )
        if (table.contains ( hCategoriesB, sCategory )) then
            return true
        end
    end
    
    return false
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
