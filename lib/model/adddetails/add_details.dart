import 'package:cloud_firestore/cloud_firestore.dart';

class AddDetails {
  AddDetails({
    required this.name,
    required this.age,
    required this.imageUrl,
  });

  factory AddDetails.fromSnapshot(DocumentSnapshot json) {
    return AddDetails(
      name: json['name'],
      age: json['age'],
      imageUrl: json['imageUrl'],
    );
  }

  final String name;
  final int age;
  final String imageUrl;

  AddDetails copyWith({
    String? name,
    int? age,
    String? imageUrl,
  }) {
    return AddDetails(
      name: name ?? this.name,
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'imageUrl': imageUrl,
    };
  }

  // String toJson() => json.encode(toMap());
  // @override
  // bool get stringify => true;
}
