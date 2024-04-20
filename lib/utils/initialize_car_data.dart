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
    "engineCoolantTemp": "",
    "engineLoad": "",
    "engineRPM": "",
    "airintakeTemp": "",
    "speed": "",
    "shortTermFuelBank1": "",
    "throttlePosition": "",
    "timingAdvance": "",
  };

String paramJSON = '''
    [
    {
        "PID": "01 05",
        "length": 1,
        "title": "Engine Coolant Temp",
        "unit": "°C",
        "description": "<int>, [0] - 40",
        "status": true
    },
    {
        "PID": "01 04",
        "length": 1,
        "title": "Engine Load",
        "unit": "%",
        "description": "<double>, [0] * 100 / 255",
        "status": true
    },
    {
        "PID": "01 0C",
        "length": 2,
        "title": "Engine RPM",
        "unit": "RPM",
        "description": "<double>, (( [0] * 256) + [1] ) / 4",
        "status": true
    },
    {
        "PID": "01 0F",
        "length": 1,
        "title": "Air Intake Temp",
        "unit": "°C",
        "description": "<int>, [0] - 40",
        "status": true
    },
    {
        "PID": "01 0D",
        "length": 1,
        "title": "Speed",
        "unit": "km/h",
        "description": "<int>, [0]",
        "status": true
    },
    {
        "PID": "01 06",
        "length": 1,
        "title": "Short Term Fuel Bank 1",
        "unit": "%",
        "description": "<double>, ([0] - 128) * 100 / 128",
        "status": true
    },
    {
        "PID": "01 11",
        "length": 1,
        "title": "Throttle Position",
        "unit": "%",
        "description": "<double>, [0] * 100 / 255",
        "status": true
    },
    {
        "PID": "01 0E",
        "length": 1,
        "title": "Timing Advance",
        "unit": "°",
        "description": "<double>, ([0] - 128) * 0.5",
        "status": true
    }
]
  ''';
