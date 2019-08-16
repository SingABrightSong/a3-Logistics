/* 		
		cargoLoader.sqf
		by SingABrightSong
		
		Usage: Define base types in the following array and call the script from a vehicle.
		
		A surprising number of objects can be loaded this way, this is a very small subset of reasonable objects
		
		Fun fact: Multiline comments at the top of the script file have the additional effect of moving the code closer to the middle of the screen where you can actually read it!
*/
	
	cargoTypes = ["Slingload_base_F", "Land_FoodSack_01_cargo_base_F"]; // define loadable object types here. Do not be too broad, loadable objects include the player
	
	
	_this addAction
	[
	
		"Load cargo",
		{
			private _veh = _this select 0;
			private _cargo = _this select 1 nearEntities [cargoTypes, 5] select 0;
			_veh setVehicleCargo _cargo;
		},
		[],
		1.5, 
		true, 
		false, 
		"",
		"_target canVehicleCargo (_this nearEntities [cargoTypes, 5] select 0) select 0"
		
	];
	
	_this addAction 
	[

		"Unload cargo", 
		{
			private _allCargo = getVehicleCargo (_this select 0);
			private _cargoIndex = count _allCargo - 1;
			private _cargo = _allCargo select _cargoIndex;
			objNull setVehicleCargo _cargo;
		},
		[],
		1.5, 
		true, 
		false, 
		"",
		"!isNull (getVehicleCargo _target select 0)"
		
	];
	