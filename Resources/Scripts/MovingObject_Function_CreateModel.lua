--------------------------------------------------------------------------------
--  Function......... : CreateModel
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.CreateModel ( sName )
--------------------------------------------------------------------------------
	
    local hScene = application.getCurrentUserScene ( )
    local hUser = application.getCurrentUser( )
    
    log.message( "In fnc CreateModel.......")
    
    
    
    --Get position.
    --
       
    local hWall
    
    
    --Create 3d object in scene.
    --
    
    local hObject = scene.createRuntimeObject ( hScene, this.sListSelection( ) )--TODO

    
    log.message( "Leaving fnc CreateModel.......")
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
