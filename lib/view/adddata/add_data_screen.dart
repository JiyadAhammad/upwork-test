import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../splash/splash_screen.dart';
import '../widget/text_form_field.dart';

class AddDataScreen extends StatelessWidget {
  AddDataScreen({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgrounColor(),
      child: Scaffold(
        backgroundColor: ktransparent,
        appBar: AppBar(
          title: Text(
            'AddDetails',
          ),
          centerTitle: true,
          backgroundColor: ktransparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormFieldWidget(
                prefixIcon: Icons.account_circle_rounded,
                hintText: 'Enter your Name(Required*)',
                controller: nameController,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please Enter The Name';
                  }
                  return null;
                },
                borderRadius: 13.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
