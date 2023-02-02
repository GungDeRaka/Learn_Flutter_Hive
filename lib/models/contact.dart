// ignore_for_file: public_member_api_docs, sort_constructors_first
// isi age and name
class Contact {
  final String? name;
  final int? age;
  Contact({
    required this.name,
    required this.age,
  });
  

  @override
  String toString() => 'Contact(name: $name, age: $age)';
}
