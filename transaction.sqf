	params ["_entity", "_curator"];
	
	private _thisPlayer = getAssignedCuratorUnit _curator;

	private _fuelTend = _thisPlayer nearEntities ["CargoNet_01_barrels_F" ,50];
	private _foodTend = _thisPlayer nearEntities ["Land_FoodSacks_01_cargo_brown_F" ,50];
	private _partTend = _thisPlayer nearEntities ["CargoNet_01_box_F" ,50];
	private _ammoTend = _thisPlayer nearEntities [["B_CargoNet_01_ammo_F", "I_CargoNet_01_ammo_F", "O_CargoNet_01_ammo_F"] ,50];
	
	private _costTable = call compileFinal preprocessFileLineNumbers "costTableTest.sqf";
	
	private _objectIndex = _costTable findIf {(_x # 0) == typeOf _entity};
	
	private _price = ((_costTable # _objectIndex) # 1);
	
	if (((_price # 0) <= count _fuelTend) && ((_price # 1) <= count _foodTend)
	&& ((_price # 2) <= count _partTend) && ((_price # 3) <= count _ammoTend)) then 
	
	{
		for "_i" from 0 to (_price # 0) -1 do {deleteVehicle (_fuelTend # _i)};
		for "_i" from 0 to (_price # 1) -1 do {deleteVehicle (_foodTend # _i)};
		for "_i" from 0 to (_price # 2) -1 do {deleteVehicle (_partTend # _i)};
		for "_i" from 0 to (_price # 3) -1 do {deleteVehicle (_ammoTend # _i)};	
	}
	
	else 
	{
		deleteVehicle _entity;
		hint "Insufficient resources";
	};