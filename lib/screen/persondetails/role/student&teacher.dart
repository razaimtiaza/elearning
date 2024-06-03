import 'package:e_learning/screen/persondetails/teacherdetail/teacherdetail.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StudentTeacher extends StatefulWidget {
  const StudentTeacher({super.key});

  @override
  State<StudentTeacher> createState() => _StudentTeacherState();
}

class _StudentTeacherState extends State<StudentTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "Select the role!!",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ).paddingOnly(top: 80),
          ),
          GestureDetector(
            onTap: () {
              Get.to(TeacherProfile());
            },
            child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.height * 0.3,
                    child: Image.asset('asset/images/teacher.jpg'))
                .paddingOnly(top: MediaQuery.of(context).size.height * 0.05),
          ),
          SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.3,
                  child: Image.asset('asset/images/student1.png'))
              .paddingOnly(top: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
