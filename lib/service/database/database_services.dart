import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/adddetails/add_details.dart';

class DataBaseService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<dynamic> alldata = [];

  Stream<List<AddDetails>> getData() {
    return firebaseFirestore.collection('items').snapshots().map(
      (QuerySnapshot<Map<String, dynamic>> snapshot) {
        return snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
                AddDetails.fromSnapshot(doc))
            .toList();
      },
    );
  }

  Future<void> addData({
    required String name,
    required String image,
    required int age,
  }) async {
    log('message');

    final addFeild = firebaseFirestore.collection('items').doc();
    // final Map<String, dynamic> json = {
    //   'name': name,
    //   'imageUrl': image,
    //   'age': age,
    // };

    final user = AddDetails(
      id: addFeild.id,
      name: name,
      age: age,
      imageUrl: image,
    );
    final Map<String, dynamic> json = user.toMap();
    await addFeild.set(json);
  }
}
