import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color/colors.dart';
import '../home/home_sreen.dart';
import '../splash/splash_screen.dart';
import 'widget/login_page_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: kblackIcon,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went wrong'),
            );
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return LoginPageWidget(
              fText: 'ForgetPasword ?',
              buttonText: 'Login',
              bottomText: "Don't Have an Account?",
              page: 'Signup',
              onPressed: () {
                Get.snackbar(
                  'Error',
                  'Please Login ',
                  titleText: const Text(
                    'Error',
                    style: TextStyle(
                      color: kwhiteText,
                    ),
                  ),
                  messageText: const Text(
                    'Please Login',
                    style: TextStyle(
                      color: kwhiteText,
                    ),
                  ),
                  animationDuration: const Duration(seconds: 2),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundGradient: const LinearGradient(
                    colors: <Color>[
                      Color(0xFF000428),
                      Color(0xFF004e92),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
