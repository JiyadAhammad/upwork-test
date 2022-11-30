import 'package:get/get.dart';

import '../../service/database/database_services.dart';

class Datacontroller extends GetxController {
  final DataBaseService dataBaseService = DataBaseService();
  var dataField = [].obs;

  @override
  void onInit() {
    dataField.bindStream(dataBaseService.getData());
    super.onInit();
  }

  var newField = {}.obs;

  // get name => newField['name'];
  // get age => newField['age'];
  // get imageUrl => newField['imageUrl'];
}
