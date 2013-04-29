--------------------------------------------------------------------------------
--  Function......... : DestroyObject
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.DestroyObject ( hObject )
--------------------------------------------------------------------------------
	
    if hObject == nil then
    local hObject = this.hLastObject ( )
    end
    
    local hObjects = this.tObjectGroup ( )
    
    if hObject then
    
    local nModels = this.nSceneModels ( )
    
    
    local tObjects = this.tObjectGroup ( )
    
    local sTag = scene.getObjectTag ( application.getCurrentUserScene ( ), hObject )
    
    
    
    log.message ( "Destroying ", hObject, " Removing object from ObjectList")
    
    log.message ( "Destroying ", sTag, " Removing object from ObjectList")
    
    local nSize = table.getSize ( hObjects )
    
    for i = 0 , nSize-1
     do
      local sObject = table.getAt ( tObjects, i )
      log.message ( "Got from table: ", sObject, "" )
      
      if sObject == sTag then      
      table.removeAt ( tObjects, i )
      
      this.nSceneModels ( nModels - 1)
      end
     end
    
    log.message( "Destroying runtimeobject: ", hObject)
    
    local sName = object.getModelName ( hObject )
    local x, y, z = object.getTranslation ( hObject, object.kGlobalSpace )
    
    this.RecordAction ( sName, 1, x, y, z )
    scene.destroyRuntimeObject ( application.getCurrentUserScene ( ), hObject )
    
    
    else
    --do stuff
    end
    
    
    
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
