class RegisteredModel {
  final DateTime date;
  final int age;

  RegisteredModel({
    required this.date,
    required this.age,
  });

  factory RegisteredModel.fromJson(Map<String, dynamic> json) {
    return RegisteredModel(
      date: DateTime.parse(json['date']),
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'age': age,
      };
}
