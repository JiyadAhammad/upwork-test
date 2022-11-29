import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../adddata/add_data_screen.dart';
import '../constant/color/colors.dart';
import '../splash/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgrounColor(),
      child: Scaffold(
        backgroundColor: ktransparent,
        appBar: AppBar(
          backgroundColor: ktransparent,
          elevation: 0,
          title: const Text(
            'UPMARKET',
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Get.to(() => AddDataScreen());
              },
              icon: const Icon(
                Icons.add_circle_outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
