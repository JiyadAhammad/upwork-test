import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constant/color/colors.dart';
import '../../constant/sizedbox/sizedbox.dart';
import '../../widget/text_form_field.dart';

class LoginPageWidget extends StatelessWidget {
  LoginPageWidget({
    super.key,
    required this.buttonText,
    required this.bottomText,
    required this.page,
    required this.onPressed,
    this.fText = '',
  });
  final String buttonText;
  final String bottomText;
  final String page;
  final String fText;
  final Function() onPressed;

  final TextEditingController emailLController = TextEditingController();

  final TextEditingController pswrdLController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 3,
          horizontal: 10,
        ),
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset('asset/image/otp.png'),
            ],
          ),
          kheight20,
          Column(
            children: <Widget>[
              TextFormFieldWidget(
                controller: emailLController,
                prefixIcon: Icons.person,
                hintText: 'Email/Mobile',
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'please Enter your Email';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'please Enter Valid Email';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  emailLController.text = value!;
                },
              ),
              TextFormFieldWidget(
                controller: pswrdLController,
                prefixIcon: Icons.https,
                hintText: 'Password',
                visble: true,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'please Enter your Password';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  pswrdLController.text = value!;
                },
              ),
              kheight,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kwhite,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width / 1.5,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  singIn(
                    emailLController.text,
                    pswrdLController.text,
                    context,
                  );
                },
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: kblackText,
                    fontSize: 20,
                  ),
                ),
              ),
              kheight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bottomText,
                    style: const TextStyle(
                      color: kwhiteText,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      page,
                      style: const TextStyle(
                        // color: kblackText,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> singIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    if (formKey.currentState!.validate()) {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((UserCredential value) {
        Fluttertoast.showToast(msg: 'Login Successfull');
        Navigator.pushReplacementNamed(context, '/home');
      }).catchError(
        (dynamic error) {
          Fluttertoast.showToast(
            msg: error!.toString(),
          );
        },
      );
    }
  }
}
