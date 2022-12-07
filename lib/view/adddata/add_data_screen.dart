import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upmarkettest/model/adddetails/add_details.dart';

import '../../controller/data/data_controller.dart';
import '../../service/database/database_services.dart';
import '../../service/storage/storage_service.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../splash/splash_screen.dart';

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
          child: ListView(
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
                      // log('${image.path} this th direct path');
                      await storage.uploadImage(image);
                      final String imageUrl =
                          await storage.getDownloadURL(image.name);

                      dataControler.newField.update(
                        'imageUrl',
                        (_) => imageUrl,
                        ifAbsent: () => imageUrl,
                      );
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
              textFormFeild(
                'Enter your Name (Required*)',
                'name',
                dataControler,
              ),
              textFormFeild(
                'Enter your Age (Required*)',
                'age',
                dataControler,
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
                  // log(dataControler.newField['name']);
                  service.addData(
                    name: dataControler.newField['name'] as String,
                    image: dataControler.newField['imageUrl'] as String,
                    age: int.parse(dataControler.newField['age'] as String),
                  );

                  Get.back();
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
    );
  }

  Padding textFormFeild(
    String hintText,
    String name,
    Datacontroller datacontroller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 24,
          color: kwhiteText,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: kwhite,
          prefixIcon: Icon(
            Icons.account_circle_rounded,
            color: kbluegrey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.0),
            borderSide: const BorderSide(
              color: kwhite,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              width: 3,
              color: kwhite,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 3,
              color: kwhite,
            ),
          ),
          fillColor: kbluegrey,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: kwhite54,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: (String value) {
          dataControler.newField.update(
            name,
            (_) => value,
            ifAbsent: () => value,
          );
        },
      ),
    );
  }
}
