class StreetModel {
  final String name;
  final int number;

  StreetModel({required this.name, required this.number});

  factory StreetModel.fromJson(Map<String,dynamic> json){
    return StreetModel(
      name : json['name'] ?? '',
      number : json['number']
    );
  }
  String get adress => '$number $name';

  Map<String, dynamic> toJson() => {
    'name' : name,
    'number' : number
  };
}