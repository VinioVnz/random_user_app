class StreetModel {
  final String name;
  final int number;

  StreetModel({required this.name, required this.number});

  factory StreetModel.fromJson(Map<String,dynamic> json){
    return StreetModel(
      name : json['name'],
      number : int.tryParse(json['number']) ?? 0
    );
  }
}