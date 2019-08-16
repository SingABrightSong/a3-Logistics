		params ["_platform"];

		private _platformArray = getPosWorld _platform nearObjects ["CargoPlatform_01_base_F", 9]; 
			 
		
		{
			private _relPos = _x worldToModel getPosWorld _platform;
	
			if ((_relPos # 0) > 0 && (_relPos # 0) < 9) then
					{if (nearestObject[(_x modelToWorld [6.015, 0, 0]), "CargoPlatform_01_base_F"] == _platform) then			
					{_platform setPosWorld (_x modelToWorldWorld [6.015, 0, 0]);}};
			if ((_relPos # 0) < 0 && (_relPos # 0) > -9) then
					{if (nearestObject[(_x modelToWorld [-6.015, 0, 0]), "CargoPlatform_01_base_F"] == _platform) then		
					{_platform setPosWorld (_x modelToWorldWorld [-6.015, 0, 0]);}};
			if ((_relPos # 1) > 0 && (_relPos # 1) < 9) then
					{if (nearestObject[(_x modelToWorld [0, 6.015, 0]), "CargoPlatform_01_base_F"] == _platform) then
					{_platform setPosWorld (_x modelToWorldWorld [0, 6.015, 0]);}};
			if ((_relPos # 1) < 0 && (_relPos # 1) > -9 ) then
					{if (nearestObject[(_x modelToWorld [0, -6.015, 0]), "CargoPlatform_01_base_F"] == _platform) then
					{_platform setPosWorld (_x modelToWorldWorld [0, -6.015, 0]);}};
		} forEach _platformArray;
	
		_platform animateSource ["Leg_1_Move_Source", (0 - (getPosATL _platform # 2)), true]; 
		_platform animateSource ["Leg_2_Move_Source", (0 - (getPosATL _platform # 2)), true];
		_platform animateSource ["Leg_3_Move_Source", (0 - (getPosATL _platform # 2)), true];
		_platform animateSource ["Leg_4_Move_Source", (0 - (getPosATL _platform # 2)), true];
		
		{
		if (_x != _platform) then
				{

				private _relDirA = _platform getRelDir _x; 
				private _relDirB = _x getRelDir _platform;
			
				if (_relDirA == 90) then 
				{
					_platform animateSource ["Panel_4_Hide_Source", 1 , true];

				};
				if (_relDirA == 270) then
				{
					_platform animateSource ["Panel_2_Hide_Source", 1 , true];

				};
				if (_relDirA == 180) then
				{
					_platform animateSource ["Panel_3_Hide_Source", 1 , true];

				};
				if (_relDirA == 0) then
				{
					_platform animateSource ["Panel_1_Hide_Source", 1 , true];

				};
				
				
				
				if (_relDirB == 90) then 
				{
					_x animateSource ["Panel_4_Hide_Source", 1 , true];

				};
				if (_relDirB == 270) then
				{
					_x animateSource ["Panel_2_Hide_Source", 1 , true];

				};
				if (_relDirB == 180) then
				{
					_x animateSource ["Panel_3_Hide_Source", 1 , true];

				};			
				if (_relDirB == 0) then
				{
					_x animateSource ["Panel_1_Hide_Source", 1 , true];
				};
				
				};
		} forEach _platformArray;