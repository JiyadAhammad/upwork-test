import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Datacontroller extends GetxController {
  String? pickedImage;
  String? pickedimagefromGallery;

  Future<void> getCamera() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.camera);

    pickedimagefromGallery = images!.path;
    update();
  }

  Future<void> getGallery() async {
    final XFile? images =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    pickedimagefromGallery = images!.path;

    update();
  }
}
