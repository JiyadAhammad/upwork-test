import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Login/login.dart';
import '../constant/color/colors.dart';
import '../home/home_sreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAll(
        () => const LoginScreen(),
      ),
    );
    return Container(
      decoration: backgrounColor(),
      child: Scaffold(
        backgroundColor: ktransparent,
        body: SafeArea(
          child: Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
            color: kwhite,
            size: 70.0,
          )),
        ),
      ),
    );
  }
}

BoxDecoration backgrounColor() {
  return const BoxDecoration(
    gradient: LinearGradient(
      colors: <Color>[
        Color(0xFF000428),
        Color(0xFF004e92),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
}
