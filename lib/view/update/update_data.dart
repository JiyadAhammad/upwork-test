import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:upmarkettest/view/constant/color/colors.dart';
import 'package:upmarkettest/view/splash/splash_screen.dart';

class FetchData extends StatelessWidget {
  FetchData({Key? key}) : super(key: key);

  final Query dbref = FirebaseDatabase.instance.ref().child('items');

  Widget listItem({required Map student, context}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            student.values.toList().toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'student[age]',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'student[salary]',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UpdateRecord(
                        studentKey: student['key'],
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log('nthelum work avundooo');
    return Container(
      decoration: backgrounColor(),
      child: Scaffold(
        backgroundColor: ktransparent,
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map dataItem = snapshot.value as Map;
              dataItem[key] = snapshot.key;
              return listItem(student: dataItem, context: context);
            },
          ),
        ),
      ),
    );
  }
}

class UpdateRecord extends StatelessWidget {
  const UpdateRecord({
    Key? key,
    required this.studentKey,
  }) : super(key: key);

  final studentKey;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
