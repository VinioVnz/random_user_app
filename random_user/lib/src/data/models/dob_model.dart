class DobModel {
  final DateTime date;
  final int age;

  DobModel({
    required this.date,
    required this.age,
  });

  factory DobModel.fromJson(Map<String, dynamic> json) {
    return DobModel(
      date: DateTime.parse(json['date']),
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
    'date' : date.toIso8601String(),
    'age' : age
  };
}
