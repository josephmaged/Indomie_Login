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
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: _pinned,
                snap: _snap,
                floating: _floating,
                expandedHeight: 160.0,
                backgroundColor: kPrimaryColor,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('SliverAppBar'),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: kLightColor,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        Center(
                            child: Text(
                          "${AppBloc.get(context).employee?.employeeName}",
                        )),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(
                            "${AppBloc.get(context).employee?.employeeNameArabic}",
                            style: const TextStyle(
                              color: kLightBlackColor
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
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
              ),
            ],
          ),
        );
      },
    );
  }
}
