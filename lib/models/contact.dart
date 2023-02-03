import 'package:hive/hive.dart';
part 'contact.g.dart';

//? cara menggunakan type adapter
//tambahkan
@HiveType(typeId: 0)
class Contact {
  // ?kemudian tambahkan hivefield(index)
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final int? age;
  Contact({
    required this.name,
    required this.age,
  });
  

  @override
  String toString() => 'Contact(name: $name, age: $age)';
}
