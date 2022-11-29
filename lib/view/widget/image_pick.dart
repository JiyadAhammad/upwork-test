import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/data/data_controller.dart';
import '../constant/color/colors.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Wrap(
        children: <Widget>[
          ListTile(
            onTap: () async {
              Get.find<Datacontroller>().getCamera();
              Get.back();
            },
            leading: const Icon(
              Icons.add_a_photo,
              color: kwhite,
            ),
            title: const Text(
              'Camera',
              style: TextStyle(
                color: kwhite,
              ),
            ),
          ),
          ListTile(
            onTap: () async {
              Get.find<Datacontroller>().getGallery();
              Get.back();
            },
            leading: const Icon(
              Icons.collections,
              color: kwhite,
            ),
            title: const Text(
              'Galley',
              style: TextStyle(
                color: kwhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
