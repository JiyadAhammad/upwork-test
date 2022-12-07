
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
        ),
      ),
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
          '${item.name.toUpperCase()}',
          style: const TextStyle(color: kwhite),
        ),
        subtitle: Text(
          '${item.age}',
          style: TextStyle(color: kbluegrey),
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.edit,
                color: kgreen,
              ),
            ),
            IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.delete,
                color: kred,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
