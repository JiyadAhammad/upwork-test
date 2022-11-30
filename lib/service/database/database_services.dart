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

  Future<void> addData(AddDetails item) {
    return firebaseFirestore.collection('items').add(
          item.toMap(),
        );
  }
}
