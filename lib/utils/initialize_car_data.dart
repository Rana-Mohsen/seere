Map<String, dynamic> requistData = {
  //"date": ,
  "troubleCode": "03",
  // "description": ,
  // "carYear": ,
  // "enginePower": ,
  "engineCoolantTemp": "01 05",
  "engineLoad": "01 04",
  "engineRPM": "01 0C",
  "airintakeTemp": "01 0F",
  "speed": "01 0D",
  "shortTermFuelBank1": "01 06",
  "throttlePosition": "01 11",
  "timingAdvance": "01 0E",
};

Map<String, dynamic> requistedData = {
  "engineCoolantTemp": "0",
  "engineLoad": "0",
  "engineRPM": "0",
  "airintakeTemp": "0",
  "speed": "0",
  "shortTermFuelBank1": "0",
  "throttlePosition": "0",
  "timingAdvance": "0",
};

String paramJSON = '''
    [
    {
        "PID": "01 05",
        "title": "Engine Coolant Temp",
        "description": "<int>, [0] - 40"
    },
    {
        "PID": "01 04",
        "title": "Engine Load",
        "description": "<double>, [0] * 100 / 255"
    },
    {
        "PID": "01 0C",
        "title": "Engine RPM",
        "description": "<double>, (( [0] * 256) + [1] ) / 4"
    },
    {
        "PID": "01 0F",
        "title": "Air Intake Temp",
        "description": "<int>, [0] - 40"
    },
    {
        "PID": "01 0D",
        "title": "Speed",
        "description": "<int>, [0]"
    },
    {
        "PID": "01 06",
        "title": "Short Term Fuel Bank 1",
        "description": "<double>, ([0] - 128) * 100 / 128"
    },
    {
        "PID": "01 11",
        "title": "Throttle Position",
        "description": "<double>, [0] * 100 / 255"
    },
    {
        "PID": "01 0E",
        "title": "Timing Advance",
        "description": "<double>, ([0] - 128) * 0.5"
    }
]
  ''';

String dtcJSON = '''
        [
        {
		        "id": 1,
		        "created_at": "2021-12-05T16:33:18.965620Z",
		        "command": "03",
		        "response": "6",
		        "status": true
		    },
		    {
		        "id": 7,
		        "created_at": "2021-12-05T16:35:01.516477Z",
		        "command": "01 05",
		        "response": "",
		        "status": true
		    },
		    {
		        "id": 6,
		        "created_at": "2021-12-05T16:34:51.417614Z",
		        "command": "01 04",
		        "response": "",
		        "status": true
		    },
		    {
		        "id": 5,
		        "created_at": "2021-12-05T16:34:23.837086Z",
		        "command": "01 0C",
		        "response": "",
		        "status": true
		    },
		    {
		        "id": 4,
		        "created_at": "2021-12-05T16:34:12.496052Z",
		        "command": "01 0F",
		        "response": "",
		        "status": true
		    },
		    {
		        "id": 3,
		        "created_at": "2021-12-05T16:33:38.323200Z",
		        "command": "01 0D",
		        "response": "6",
		        "status": true
		    },
		    {
		        "id": 2,
		        "created_at": "2021-12-05T16:33:28.439547Z",
		        "command": "01 06",
		        "response": "6",
		        "status": true
		    },
		    {
		        "id": 34,
		        "created_at": "2021-12-05T16:41:25.883408Z",
		        "command": "01 11",
		        "response": "",
		        "status": true
		    },
		    {
		        "id": 35,
		        "created_at": "2021-12-05T16:41:38.901888Z",
		        "command": "01 0E",
		        "response": "",
		        "status": true
		    }
		 ]
      ''';
