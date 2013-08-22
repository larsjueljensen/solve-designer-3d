--------------------------------------------------------------------------------
--  Function......... : createDragObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function DragAndDropController.createDragObject ( sArticleNumber )
--------------------------------------------------------------------------------
	
    local hObject = scene.createRuntimeObject ( application.getCurrentUserScene ( ), sArticleNumber.."/"..sArticleNumber )

    this.articleNumber ( sArticleNumber )
    this.articleType( this.getArticleType( sArticleNumber ) )

    this.setDragObjectSensorMaskBits ( hObject )
    this.fixDragObjectTRSFlags( hObject )
    
    local hWardrobeObject = this.createWardrobeObject ( hObject )
    object.setParent ( hObject, hWardrobeObject, true )
    object.setVisible ( hWardrobeObject, false )

    this.setObjectOpacity ( hWardrobeObject, 0.8 )
    
    if ( string.compare( this.articleType ( ), "D3D_HULL" ) == 0 ) then
        this.addSnapTargetSensor ( hWardrobeObject )
    end

    this.hDragObject ( hWardrobeObject )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
