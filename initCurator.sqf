	this addEventHandler ["CuratorObjectPlaced", { 
	params ["_curator", "_entity"]; 
	  
	[_entity, _curator] call compileFinal preprocessFIleLineNumbers "transaction.sqf";
	  
	if (_entity isKindOf "CargoPlatform_01_base_F") then 
	{ 
		_entity call compileFinal preprocessFIleLineNumbers "platformPanelPropagator.sqf"; 
	}; 
	}]; 


	this addEventHandler ["CuratorObjectEdited", { 
	   
	params ["_curator", "_entity"]; 
	if (_entity isKindOf "CargoPlatform_01_base_F") then 
	{ 
		_entity call compileFinal preprocessFIleLineNumbers "platformPanelPropagator.sqf"; 
		};
	}]; 

	this addEventHandler ["CuratorObjectRegistered", {

		params ["_curator", "_input"];
		private _thisPlayer = getAssignedCuratorUnit _curator;
		_curator addCuratorEditingArea [0,getPos _thisPlayer, 50];
		_curator addCuratorCameraArea [0,getPos _thisPlayer, 50];
		_curator setCuratorCameraAreaCeiling 50;
		
		
		_costs = [];
		_costTable = call compileFinal preprocessFileLineNumbers "costTableTest.sqf";
		
		{
		
			private _inputX = _x;
			
			
			_cost = if (_costTable findIf {_inputX == _x # 0} > -1) then {[true,0,0]} else {[false, 0,0]};
			
			_costs pushBack _cost;
			
		} forEach (_input);
		
		
		//_costs
		_input
		
			
	}];