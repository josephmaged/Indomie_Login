import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indomie_login/config/const.dart';
import 'package:indomie_login/core/model/Employee.dart';
import 'package:indomie_login/core/util/bloc/app/cubit.dart';
import 'package:indomie_login/core/util/bloc/app/states.dart';
import 'package:indomie_login/features/login/widget/login_widget.dart';
import 'package:indomie_login/features/widgets/reusable_text.dart';
import 'package:indomie_login/features/widgets/reusable_tile.dart';
import 'package:indomie_login/network/dio_helper.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
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
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ReusableText(
                            text: 'Employee Name:',
                          ),
                          const SizedBox(height: 10),
                          ReusableTile(
                            string: "${AppBloc.get(context).employee?.employeeName}",
                          ),
                          const SizedBox(height: 15),
                          const ReusableText(
                            text: 'Employee Arabic Name:',
                          ),
                          const SizedBox(height: 10),
                          ReusableTile(
                            string: "${AppBloc.get(context).employee?.employeeNameArabic}",
                          ),
                          const SizedBox(height: 15),
                          const ReusableText(
                            text: 'Employee Department:',
                          ),
                          const SizedBox(height: 10),
                          ReusableTile(
                            string: "${AppBloc.get(context).employee?.employeeDepartment}",
                          ),
                          const SizedBox(height: 15),
                          const ReusableText(
                            text: 'Employee Job Title:',
                          ),
                          const SizedBox(height: 10),
                          ReusableTile(
                            string: "${AppBloc.get(context).employee?.employeeJobTitle}",
                          ),
                          const SizedBox(height: 15),
                          const ReusableText(
                            text: 'Employee Job Position:',
                          ),
                          const SizedBox(height: 10),
                          ReusableTile(
                            string: "${AppBloc.get(context).employee?.employeeJobPosition}",
                          ),
                          const SizedBox(height: 15),
                          const ReusableText(
                            text: 'Employee Join Date:',
                          ),
                          const SizedBox(height: 10),
                          ReusableTile(
                            string: "${AppBloc.get(context).employee?.employeeJoinDate}",
                          ),
                          const SizedBox(height: 15),
                          const ReusableText(
                            text: 'Employee Born Date:',
                          ),
                          const SizedBox(height: 10),
                          ReusableTile(
                            string: "${AppBloc.get(context).employee?.employeeBornDate}",
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
      },
    );
  }
}
