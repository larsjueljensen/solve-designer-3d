--------------------------------------------------------------------------------
--  Function......... : createItems
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ArticleInfoAI.createItems ( )
--------------------------------------------------------------------------------

    local hUser = this.getUser ( )
	local hHolder = hud.getComponent( hUser, "main.ArticleInfo")
    
    local nLine = 7
    local nPosY = 85
    
    for i = 0, nLine -1 do
    
        local hLabel = this.createComponent ( hHolder, "main.label_", i, 8, nPosY, 30, 9 )
        hud.setComponentBackgroundColor ( hLabel, 127, 127, 127, 0 )

        local hData = this.createComponent ( hHolder, "main.data_", i, 40, nPosY, 50, 9 )
        hud.setComponentBackgroundColor ( hData, 0, 127, 0, 0 )        
        
        nPosY = nPosY - 9
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------

