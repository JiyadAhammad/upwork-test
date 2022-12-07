import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/data/data_controller.dart';
import '../../../model/adddetails/add_details.dart';
import '../../constant/color/colors.dart';
import '../../update/update_data.dart';

class DataListWidget extends StatelessWidget {
  DataListWidget({
    super.key,
    required this.item,
    required this.index,
  });

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
          item.name.toUpperCase(),
          style: const TextStyle(color: kwhite),
        ),
        subtitle: Text(
          '${item.age}',
          style: const TextStyle(color: kbluegrey),
        ),
        trailing: Wrap(
          children: <Widget>[
            IconButton(
              onPressed: () async {
                // log(item.id);
                Get.to(
                  () => UpdateRecord(
                    name: item.name,
                    age: item.age,
                    index: index,
                    docId: item.id,
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: kgreen,
              ),
            ),
            IconButton(
              onPressed: () async {},
              icon: const Icon(
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
