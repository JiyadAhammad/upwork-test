import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:upmarkettest/model/adddetails/add_details.dart';

import '../../controller/data/data_controller.dart';
import '../adddata/add_data_screen.dart';
import '../constant/color/colors.dart';
import '../splash/splash_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final Datacontroller dataController = Get.put(Datacontroller());
  final Datacontroller datacontroller = Get.put(Datacontroller());

  @override
  Widget build(BuildContext context) {
    log('${datacontroller.dataField.length} lwngth of items');
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
                return datacontroller.dataField.length == 0
                    ? LottieBuilder.asset('asset\lottie\emptyfile.json')
                    : Padding(
                        padding: EdgeInsets.only(
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
          )),
    );
  }
}

class DataListWidget extends StatelessWidget {
  DataListWidget({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final AddDetails item;
  final int index;
  final Datacontroller dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(width: 3.0, color: kwhite),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: ListTile(
        onTap: () {
          //   Get.to(
          //     transition: Transition.downToUp,
          //     duration: const Duration(
          //       milliseconds: 800,
          //     ),
          //     StudentDetail(
          //       index: index,
          //       dataList: studentController.list[index],

          //     ),
          //   );
        },

        leading: CircleAvatar(
          child: SizedBox(
            height: 40,
            child: item.imageUrl.isEmpty
                ? const CircularProgressIndicator(
                    strokeWidth: 2.0,
                  )
                : Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        title: Text(
          '${item.name}',
          // stdobj.list[index].studentName!.toUpperCase(),
          style: const TextStyle(color: kwhite),
        ),
        subtitle: Text(
          '${item.age}',
          // stdobj.list[index].studentDomain!,
          style: TextStyle(color: kbluegrey),
        ),
        // trailing: Wrap(
        //   children: <Widget>[
        //     IconButton(
        //       padding: EdgeInsets.zero,
        //       onPressed: () {
        //         Get.to(
        //           UpdateScreen(
        //             index: index,
        //           ),
        //         );
        //       },
        //       icon: const Icon(
        //         Icons.edit,
        //         color: kgreen,
        //       ),
        //     ),
        //     IconButton(
        //       padding: EdgeInsets.zero,
        //       onPressed: () {
        //         // if (stdobj.list[index].id == null) {
        //         //   return;
        //         // }
        //         // stdobj.deleteStudent(
        //         //   stdobj.list[index].id!,
        //         //   index,
        //         // );
        //         Get.defaultDialog(
        //           title: 'Alert!!',
        //           titleStyle: const TextStyle(
        //             fontSize: 25,
        //             color: kwhite,
        //           ),
        //           middleText: 'Do you want to Delete ',
        //           middleTextStyle: const TextStyle(
        //             fontSize: 20,
        //             color: kwhite,
        //           ),
        //           backgroundColor: kblack,
        //           textConfirm: 'Ok',
        //           confirmTextColor: kblack,
        //           onConfirm: () {
        //             stdobj.deleteStudent(
        //               stdobj.list[index].id!,
        //               index,
        //             );
        //             Get.offAll(HomeSceen());
        //             Get.snackbar(
        //               'title',
        //               'message',
        //               titleText: const Center(
        //                 child: Text(
        //                   'Success',
        //                   style: TextStyle(
        //                     fontSize: 20,
        //                     color: kred,
        //                   ),
        //                 ),
        //               ),
        //               messageText: const Center(
        //                 child: Text(
        //                   'Successfully Deleted',
        //                   style: TextStyle(
        //                     fontSize: 18,
        //                     color: kwhite,
        //                   ),
        //                 ),
        //               ),
        //               snackPosition: SnackPosition.BOTTOM,
        //               backgroundColor: kblack,
        //               colorText: kwhite,
        //               maxWidth: 250,
        //               margin:
        //                   const EdgeInsets.only(bottom: 15),
        //             );
        //           },
        //           buttonColor: kwhite,
        //           textCancel: 'Cancel',
        //           cancelTextColor: kwhite,
        //           onCancel: () {
        //             Get.offAll(HomeSceen());
        //           },
        //           barrierDismissible: false,
        //         );
        //       },
        //       icon: const Icon(
        //         Icons.delete,
        //         color: kred,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
