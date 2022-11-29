import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../splash/splash_screen.dart';
import '../widget/image_pick.dart';
import '../widget/text_form_field.dart';

class AddDataScreen extends StatelessWidget {
  AddDataScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  File? image;
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  // clipBehavior: Clip.none,
                  // fit: StackFit.expand,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 150.0,
                      backgroundColor: kblack,
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: RawMaterialButton(
                        onPressed: () {
                          Get.bottomSheet(
                            const ImageBottomSheet(),
                            // barrierColor: kgrey,
                            backgroundColor: kblack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: kwhite,
                                width: 2.0,
                              ),
                            ),
                          );
                        },
                        fillColor: const Color(0xFFF5F6F9),
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
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
                  onPressed: () {},
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
