import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/data/data_controller.dart';
import '../adddata/add_data_screen.dart';
import '../constant/color/colors.dart';
import '../splash/splash_screen.dart';
import 'widget/data_list_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Datacontroller datacontroller = Get.put(Datacontroller());

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
        body: Obx(
          () => ListView.builder(
            itemCount: datacontroller.dataField.length,
            itemBuilder: (BuildContext context, int index) {
              return datacontroller.dataField.isEmpty
                  ? LottieBuilder.asset('asset/lottie/emptyfile.json')
                  : Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 10,
                        left: 10,
                      ),
                      child: DataListWidget(
                        item: datacontroller.dataField[index],
                        index: index,
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
