--------------------------------------------------------------------------------
--  Function......... : CalculateThumbnailSizes
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Slider.CalculateThumbnailSizes ( nPos )
--------------------------------------------------------------------------------

    local nMagnifyStartPos = 30
    local nFullScaleStartPos = 40
    local nFullScaleEndPos = 60
    local nMagnifyEndPos = 70
    
    local nThumbnailMinWidth = 36
    local nThumbnailMinHeight = 50
    local nThumbnailMaxWidth = 58
    local nThumbnailMaxHeight = 80

    local nThumbnailHeight = nThumbnailMinHeight
    local nThumbnailWidth = nThumbnailMinWidth

    if nPos > nMagnifyStartPos and nPos < nMagnifyEndPos then
        if nPos < nFullScaleStartPos then
            local nFactor = ( nPos - nMagnifyStartPos ) / ( nFullScaleStartPos - nMagnifyStartPos )
            nThumbnailWidth = math.interpolate ( nThumbnailMinWidth, nThumbnailMaxWidth, nFactor )
            nThumbnailHeight = math.interpolate ( nThumbnailMinHeight, nThumbnailMaxHeight, nFactor )
        elseif nPos < nFullScaleEndPos then
            nThumbnailWidth = nThumbnailMaxWidth
            nThumbnailHeight = nThumbnailMaxHeight
        else
            local nFactor = ( nPos - nFullScaleEndPos ) / ( nMagnifyEndPos - nFullScaleEndPos )
            nThumbnailWidth = math.interpolate ( nThumbnailMaxWidth, nThumbnailMinWidth, nFactor )
            nThumbnailHeight = math.interpolate ( nThumbnailMaxHeight, nThumbnailMinHeight, nFactor )
        end 
    end
    
    return nThumbnailWidth, nThumbnailHeight
		
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
