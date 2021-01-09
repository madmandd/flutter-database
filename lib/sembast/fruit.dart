import 'package:meta/meta.dart';

class Fruit {
  int id;

  final String name;
  final bool isSweet;

  Fruit({@required this.name, @required this.isSweet});

  Map<String, dynamic> toJson() {
    return {'name': name, 'isSweet': isSweet};
  }

  factory Fruit.fromJson(Map<String, dynamic> parsedJson) {
    return Fruit(
      name: parsedJson['name'],
      isSweet: parsedJson['isSweet'],
    );
  }
}
