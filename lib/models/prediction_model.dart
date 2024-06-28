class PredictionModel {
  final List<String> code;
  final Map<String, Data> data;
  final double estimatedHours;

  PredictionModel({
    required this.code,
    required this.data,
    required this.estimatedHours,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      code: List<String>.from(json['code']),
      data: Map.from(json['data']).map((key, value) => MapEntry(key, Data.fromJson(value))),
      estimatedHours: json['estimated_hours'],
    );
  }
@override
    String toString() {
    var entries = data.entries.map((e) => '${e.key}: ${e.value}').join(',\n');
    return 'PredictionModel{\n'
        '  code: $code,\n'
        '  data: {\n$entries\n},\n'
        '  estimatedHours: $estimatedHours,\n'
        '}';
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data.map((key, value) => MapEntry(key, value.toJson())),
      'estimated_hours': estimatedHours,
    };
  }
}

class Data {
  final String criticalLevel;
  final String description;
  final String dtcCode;
  final String longDescription;
  final List<String> reason;
  final List<String> repair;

  Data({
    required this.criticalLevel,
    required this.description,
    required this.dtcCode,
    required this.longDescription,
    required this.reason,
    required this.repair,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      criticalLevel: json['critical_level'],
      description: json['description'],
      dtcCode: json['dtc_code'],
      longDescription: json['long_description'],
      reason: List<String>.from(json['reason']),
      repair: List<String>.from(json['repair']),
    );
  }
  @override
  String toString() {
    return 'Data{\n'
        '  criticalLevel: $criticalLevel,\n'
        '  description: $description,\n'
        '  dtcCode: $dtcCode,\n'
        '  longDescription: $longDescription,\n'
        '  reason: $reason,\n'
        '  repair: $repair,\n'
        '}';
  }
  Map<String, dynamic> toJson() {
    return {
      'critical_level': criticalLevel,
      'description': description,
      'dtc_code': dtcCode,
      'long_description': longDescription,
      'reason': reason,
      'repair': repair,
    };
  }
}
