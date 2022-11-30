import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upmarkettest/view/constant/color/colors.dart';
import 'package:upmarkettest/view/constant/sizedbox/sizedbox.dart';
import 'package:upmarkettest/view/splash/splash_screen.dart';
import 'package:upmarkettest/view/widget/text_form_field.dart';

class UpdateRecord extends StatelessWidget {
  UpdateRecord(
      {Key? key,
      required this.name,
      required this.age,
      required this.index,
      required this.docId})
      : super(key: key);

  final String name;
  final int age;
  final int index;
  final String docId;
  final TextEditingController editNamecontroller = TextEditingController();
  final TextEditingController editAgecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log('$name , $age ,$index $docId');
    return Container(
      decoration: backgrounColor(),
      child: Scaffold(
        backgroundColor: ktransparent,
        appBar: AppBar(
          title: Text(
            'edit details',
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: ktransparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormFieldWidget(
                prefixIcon: Icons.abc,
                hintText: name.toUpperCase(),
                controller: editNamecontroller,
                validator: (p0) {
                  return null;
                },
              ),
              TextFormFieldWidget(
                prefixIcon: Icons.abc,
                hintText: age.toString().toUpperCase(),
                controller: editAgecontroller,
                validator: (p0) {
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
                  Map<String, dynamic> dataToUpdate = {
                    'name': editNamecontroller.text,
                    'age': editAgecontroller.text,
                  };
                  CollectionReference collectionReference =
                      FirebaseFirestore.instance.collection('items');
                  DocumentReference documentReference =
                      collectionReference.doc(docId[index]);
                  documentReference.update(dataToUpdate);
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
}
