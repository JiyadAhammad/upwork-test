import 'package:get/get.dart';

import '../../model/adddetails/add_details.dart';
import '../../service/database/database_services.dart';

class Datacontroller extends GetxController {
  final DataBaseService dataBaseService = DataBaseService();
  RxList<AddDetails> dataField = <AddDetails>[].obs;

  @override
  void onInit() {
    dataField.bindStream(dataBaseService.getData());
    super.onInit();
  }

  RxMap<dynamic, dynamic> newField = <dynamic, dynamic>{}.obs;
}
