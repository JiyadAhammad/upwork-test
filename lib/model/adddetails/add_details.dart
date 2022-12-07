import 'package:cloud_firestore/cloud_firestore.dart';

class AddDetails {
  AddDetails({
    this.id = '',
    required this.name,
    required this.age,
    required this.imageUrl,
  });

  factory AddDetails.fromSnapshot(DocumentSnapshot<Object?> json) {
    return AddDetails(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      imageUrl: json['imageUrl'] as String,
    );
  }
  final String id;
  final String name;
  final int age;
  final String imageUrl;

  AddDetails copyWith({
    String? id,
    String? name,
    int? age,
    String? imageUrl,
  }) {
    return AddDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'imageUrl': imageUrl,
    };
  }
}
