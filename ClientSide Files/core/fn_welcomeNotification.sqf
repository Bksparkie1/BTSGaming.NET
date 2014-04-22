/*
	File: fn_welcomeNotification.sqf
	
	Description:
	Called upon first spawn selection and welcomes our player.
*/
sleep 2;
_intro = [];
_civ = [format["Welcome to BTSGaming.NET Altis Life %1,<br/><br/>
	Welcome to the server! A few things have changed with <t color='#81F781'>Altis Life RPG</t> that you need to be aware of!<br/><br/>
	<t color='#819FF7'>An interaction key has been introduced which replaces the large majority of scroll wheel actions,</t> this was for performance issues. By default this key is [Left Windows], you can change this key by pressing ESC and going to Configure->Controls->Custom
	and bind 'Use Action 10' to a single key like H. This key is used for the following actions<br/><br/>
	Picking up items and money.<br/><br/>
	Fishing<br/><br/>
	Interacting with players (as a cop)<br/><br/>
	Interacting with vehicles (repairing and cop actions)<br/><br/>
	Please be aware that this mission is still <t color='#81F781'>under development</t> and bugs might occur.<br/><br/>
	If you are having issues with interacting / picking up items just wait. A quick way to know when you can interact with that item if the server allows it is by pressing your tilde key (~) and using the circle to highlight the object, when it says for example 'Pile of Money' then
	that means you can pick it up!.", name player]];
	
_cop = [format["Welcome to BTSGaming.NET Altis Life %1,<br/><br/>
	Welcome to the server! A few things have changed with Altis Life RPG that you need to be aware of!<br/><br/>
	IF YOU HAVE NOT KEYBOUND H, PLEASE DO SO NOW. IT IS REQUIRED BY OFFICERS OF BTSGAMING.NET<br/><br/>
	An interaction key has been introduced which replaces the large majority of scroll wheel actions, this was for performance issues. By default this key is [Left Windows], you can change this key by pressing ESC and going to Configure->Controls->Custom
	and bind 'Use Action 10' to a single key like H. This key is used for the following actions<br/><br/>
	Picking up items and money.<br/><br/>
	Arrests and Ticketing<br/><br/>
	Escorting<br/><br/>
	Interacting with vehicles<br/><br/>
	Please be aware that this mission is still <t color='#81F781'>under development</t> and bugs might occur.
	If you are having issues with interacting / picking up items just wait. A quick way to know when you can interact with that item if the server allows it is by pressing your tilde key (~) and using the circle to highlight the object, when it says for example 'Pile of Money' then
	that means you can pick it up!.", name player]];	
	
switch (playerSide) do {
	case west: {
		{
			_intro = _intro + [(parseText _x)];
		} forEach _cop;
		_cop = _intro;
		"Welcome To Altis" hintC _cop;
	};
	case civilian: {
		{
			_intro = _intro + [(parseText _x)];
		} forEach _civ;
		_civ = _intro;
		"Welcome To Altis" hintC _civ;
	};
	case resistance: {
		{
			_intro = _intro + [(parseText _x)];
		} forEach _civ;
		_civ = _intro;
		"Welcome To Altis" hintC _civ;
	};
};
