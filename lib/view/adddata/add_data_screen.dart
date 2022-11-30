import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/data/data_controller.dart';
import '../../model/adddetails/add_details.dart';
import '../../service/database/database_services.dart';
import '../../service/storage/storage_service.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../splash/splash_screen.dart';

import '../widget/text_form_field.dart';

class AddDataScreen extends StatelessWidget {
  AddDataScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final StorageService storage = StorageService();
  final DataBaseService service = DataBaseService();
  final Datacontroller dataControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgrounColor(),
      child: Scaffold(
        backgroundColor: ktransparent,
        appBar: AppBar(
          title: const Text(
            'AddDetails',
          ),
          centerTitle: true,
          backgroundColor: ktransparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 4,
                  child: GestureDetector(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image = await picker.pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image == null) {
                        Get.snackbar(
                          "Could't find Path",
                          'Please Select an Image',
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: kwhiteText,
                          backgroundColor: kblack,
                        );
                      }
                      if (image != null) {
                        log('${image.path} this th direct path');
                        await storage.uploadImage(image);
                        final String imageUrl =
                            await storage.getDownloadURL(image.name);

                        dataControler.newField.update(
                          'imageUrl',
                          (_) => imageUrl,
                          ifAbsent: () => imageUrl,
                        );
                        log('${dataControler.newField['imageUrl']} this is the controlller');
                      }
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: kblack,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.add_a_photo,
                              color: kwhiteIcon,
                              size: 30,
                            ),
                            kwidth20,
                            Text(
                              'Add a Image',
                              style: TextStyle(
                                color: kwhiteText,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                kheight,
                TextFormFieldWidget(
                  prefixIcon: Icons.account_circle_rounded,
                  hintText: 'Enter your Name (Required*)',
                  controller: nameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter The Name';
                    }
                    return null;
                  },
                  borderRadius: 13.0,
                ),
                TextFormFieldWidget(
                  prefixIcon: Icons.account_circle_rounded,
                  hintText: 'Enter your Age (Required*)',
                  controller: ageController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter The Name';
                    }
                    return null;
                  },
                  borderRadius: 13.0,
                ),
                kheight20,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kwhite,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width / 1.5,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    service.addData(
                      AddDetails(
                        name: dataControler.newField['name'] as String,
                        age: dataControler.newField['age'] as int,
                        imageUrl: dataControler.newField['imageUrl'] as String,
                      ),
                    );
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: kblackText,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
