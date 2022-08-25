import 'package:flutter/material.dart';
import 'package:indomie_login/config/const.dart';
import 'package:indomie_login/core/model/Employee.dart';
import 'package:indomie_login/features/login/widget/login_widget.dart';
import 'package:indomie_login/features/widgets/reusable_text.dart';
import 'package:indomie_login/features/widgets/reusable_tile.dart';
import 'package:indomie_login/network/dio_helper.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Map<dynamic, dynamic> employee = Employee().toJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kLightColor,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25, top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ReusableText(
                        text: 'Employee Name:',
                      ),
                      const SizedBox(height: 20),
                      ReusableTile(
                        string: "${employee['emp_name']}",
                      ),
                      const SizedBox(height: 25),
                      const ReusableText(
                        text: 'Employee Arabic Name:',
                      ),
                      const SizedBox(height: 20),
                      ReusableTile(
                        string: "${employee['emp_name_arabic']}",
                      ),
                      const SizedBox(height: 25),
                      const ReusableText(
                        text: 'Employee Department:',
                      ),
                      const SizedBox(height: 20),
                      ReusableTile(
                        string: "${employee['emp_dept']}",
                      ),
                      const SizedBox(height: 25),
                      const ReusableText(
                        text: 'Employee Job Title:',
                      ),
                      const SizedBox(height: 20),
                      ReusableTile(
                        string: "${employee['emp_job_title']}",
                      ),
                      const SizedBox(height: 25),
                      const ReusableText(
                        text: 'Employee Job Position:',
                      ),
                      const SizedBox(height: 20),
                      ReusableTile(
                        string: "${employee['emp_job_position']}",
                      ),
                      const SizedBox(height: 25),
                      const ReusableText(
                        text: 'Employee Join Date:',
                      ),
                      const SizedBox(height: 20),
                      ReusableTile(
                        string: "${employee['emp_join_date']}",
                      ),
                      const SizedBox(height: 25),
                      const ReusableText(
                        text: 'Employee Born Date:',
                      ),
                      const SizedBox(height: 20),
                      ReusableTile(
                        string: "${employee['emp_born_date']}",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
