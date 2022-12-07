import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/database/database_services.dart';
import '../constant/color/colors.dart';
import '../constant/sizedbox/sizedbox.dart';
import '../splash/splash_screen.dart';
import '../widget/text_form_field.dart';

class UpdateRecord extends StatelessWidget {
  UpdateRecord(
      {super.key,
      required this.name,
      required this.age,
      required this.index,
      required this.docId});

  final String name;
  final int age;
  final int index;
  final String docId;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController editNamecontroller = TextEditingController();
  final TextEditingController editAgecontroller = TextEditingController();
  final DataBaseService service = DataBaseService();

  @override
  Widget build(BuildContext context) {
    log('$name , $age ,$index $docId');
    return Container(
      decoration: backgrounColor(),
      child: Scaffold(
        backgroundColor: ktransparent,
        appBar: AppBar(
          title: const Text(
            'edit details',
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: ktransparent,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormFieldWidget(
                  prefixIcon: Icons.abc,
                  hintText: name.toUpperCase(),
                  controller: editNamecontroller,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please Enter value';
                    }
                    return null;
                  },
                ),
                TextFormFieldWidget(
                  prefixIcon: Icons.abc,
                  hintText: age.toString().toUpperCase(),
                  controller: editAgecontroller,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please Enter age';
                    }
                    return null;
                  },
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
                    if (formKey.currentState!.validate()) {
                      service.updateFeild(
                          docId, editNamecontroller, editAgecontroller);
                      Get.back();
                    }
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
