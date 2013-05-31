--------------------------------------------------------------------------------
--  Function......... : CalculatePosition
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function ObjectAI.CalculatePosition ( )
--------------------------------------------------------------------------------
	
    --Get handler to object
	local hStatic =  this.hTargetObject ( )
    local hDynamic = this.hMovingObject ( )
        
    --Get Target position
    local Xt, Yt, Zt = object.getTranslation ( hStatic, object.kGlobalSpace )
        
    --Get Bounding limits x y z
    local nMinXt, nMinYt, nMinZt = object.getBoundingBoxMin ( hStatic )
    local nMaxXt, nMaxYt, nMaxZt = object.getBoundingBoxMax ( hStatic )
    
    local nMinXd, nMinYd, nMinZd = object.getBoundingBoxMin ( hDynamic )
    local nMaxXd, nMaxYd, nMaxZd = object.getBoundingBoxMax ( hDynamic )

    --Calculate size Target    
    local nSizeXt = nMaxXt - nMinXt
    local nSizeYt = nMaxYt - nMinYt
    local nSizeZt = nMaxZt - nMinZt

    local nSizeXd = nMaxXd - nMinXd
    local nSizeYd = nMaxYd - nMinYd
    local nSizeZd = nMaxZd - nMinZd
    
    --Calculate new position.
    local Xd = (( nSizeXt + nSizeXd ) / 2 )
    local Yd = Yt + ( ( nSizeYt + nSizeYd ) / 2 )
    local Zd = (( nSizeZt + nSizeZd ) / 2 )
    return Xd, Yd, Zd, nSizeXd, nSizeYd, nSizeZd
	
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
