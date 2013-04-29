--------------------------------------------------------------------------------
--  Function......... : RecordAction
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function MovingObject.RecordAction ( sObjTag, action, vData_1, vData_2, vData_3, vData_4 )
--------------------------------------------------------------------------------
	
	log.message ( "Object: ", sObjTag )
    log.message ( "Action: ", action )
    log.message ( "vData_1: ", vData_1 )
    log.message ( "vData_2: ", vData_2 )
    log.message ( "vData_3: ", vData_3 )

    --Create -> destroy
    --Move -> Move back to previous coord.
    local hScene = application.getCurrentUserScene ( )
    local hActionList = this.ActionList ( )
    
    local nCurrentStep = table.getSize ( hActionList )/5
    log.message ( nCurrentStep )
    
    log.message ( "Action step = ", this.nActionTableEntry ( ) )
   
    if action == 0 then --Action is type 'created'
    
    --add Objecttag and actiontype to table.
    --
    table.add ( hActionList, sObjTag ) --Action: Create
    table.add ( hActionList, action )
    table.add ( hActionList, 0 )
    table.add ( hActionList, 0 )
    table.add ( hActionList, 0 )

    elseif action == 1 then --Action is type 'Destroy'
    
    --local hObj = scene.getTaggedObject( hScene, sObjTag )
    --local sModelName = object.getModelName ( sObjTag )
    log.message ( "Got tagged obj: ", sObjTag )
    --add Objecttag and actiontype to table.
    --
    table.add ( hActionList, sObjTag ) --Action: Destroy
    table.add ( hActionList, action )
    table.add ( hActionList, vData_1 )
    table.add ( hActionList, vData_2 )
    table.add ( hActionList, vData_3 )
    
    elseif action == 2 then  --Action is type 'move'
    
    table.add ( hActionList, sObjTag )
    table.add ( hActionList, action )  --Adding coordinates.
    table.add ( hActionList, this.nObjectStartX ( ) )
    table.add ( hActionList, this.nObjectStartY ( ) )
    table.add ( hActionList, this.nObjectStartZ ( ) )
    
    elseif action == 3 then --Material Changed
    table.add ( hActionList, sObjTag )
    table.add ( hActionList, action ) --Change material on object
    table.add ( hActionList,  "Material here")
    table.add ( hActionList,  nil )
    table.add ( hActionList,  nil )
    
    elseif action == 5 then--Undo action selected
    table.add ( hActionList, sObjTag )
    table.add ( hActionList, action ) --Change material on object
    table.add ( hActionList, nil )
    table.add ( hActionList, nil )
    table.add ( hActionList, nil )

    end
    
    this.nActionTableEntry ( nCurrentStep + 1)
    
   
    
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
