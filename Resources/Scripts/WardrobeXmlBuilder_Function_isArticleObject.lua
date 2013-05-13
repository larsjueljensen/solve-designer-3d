--------------------------------------------------------------------------------
--  Function......... : isArticleObject
--  Author........... : Lars Juel Jensen
--  Description...... : Returns wether or not an object might have an attached article number
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function WardrobeXmlBuilder.isArticleObject ( hObject )
--------------------------------------------------------------------------------
	
    return object.hasAIModel ( hObject, "CommonObjectProperties" )
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
