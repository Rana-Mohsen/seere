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

