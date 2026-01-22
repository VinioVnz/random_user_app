class IdModel {
  final String name;
  final String? value;

  IdModel({
    required this.name,
    required this.value,
  });

  factory IdModel.fromJson(Map<String, dynamic> json) {
    return IdModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
