import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../model/adddetails/add_details.dart';

class DataBaseService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<dynamic> alldata = <dynamic>[];

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

    final DocumentReference<Map<String, dynamic>> addFeild =
        firebaseFirestore.collection('items').doc();

    final AddDetails user = AddDetails(
      id: addFeild.id,
      name: name,
      age: age,
      imageUrl: image,
    );
    final Map<String, dynamic> json = user.toMap();
    await addFeild.set(json);
  }

  void updateFeild(
    String docId,
    TextEditingController editNamecontroller,
    TextEditingController editAgecontroller,
  ) {
    final DocumentReference<Map<String, dynamic>> docUser =
        FirebaseFirestore.instance.collection('items').doc(docId);

    docUser.update(<String, Object?>{
      'name': editNamecontroller.text,
      'age': int.parse(editAgecontroller.text),
    });
  }

  void deleteFeild(String docId) {
    final DocumentReference<Map<String, dynamic>> user =
        FirebaseFirestore.instance.collection('items').doc(docId);
    user.delete();
  }
}
