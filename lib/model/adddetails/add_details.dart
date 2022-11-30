import 'package:cloud_firestore/cloud_firestore.dart';

class AddDetails {
  AddDetails({
    required this.name,
    required this.age,
    required this.imageUrl,
  });

  factory AddDetails.fromJson(DocumentSnapshot<Object> json) {
    return AddDetails(
      name: json['name'] as String,
      age: json['age'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }

  final String name;
  final int age;
  final String imageUrl;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'imageUrl': imageUrl,
    };
  }

  // String toJson() => json.encode(toJson());
  // @override
  // bool get stringify => true;
}
