import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indomie_login/config/const.dart';
import 'package:indomie_login/core/util/bloc/app/cubit.dart';
import 'package:indomie_login/core/util/bloc/app/states.dart';
import 'package:indomie_login/features/home/page/home_page.dart';
import 'package:indomie_login/features/widgets/reusable_button.dart';
import 'package:indomie_login/features/widgets/reusable_text.dart';
import 'package:indomie_login/features/widgets/reusable_textfield.dart';
import 'package:indomie_login/network/dio_helper.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 100),
                    child: Text(
                      'Hi, \nWelcome back.',
                      style: TextStyle(color: kPrimaryColor, fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const ReusableText(text: 'User Name'),
                  const SizedBox(height: 15),
                  ReusableTextField(
                    text: AppBloc.get(context).username,
                    hintText: 'User Name',
                    errorText: 'Please Enter User Name',
                    obscure: false,
                  ),
                  const SizedBox(height: 25),
                  const ReusableText(text: 'Password'),
                  const SizedBox(height: 15),
                  ReusableTextField(
                    text: AppBloc.get(context).password,
                    hintText: 'Password',
                    errorText: 'Please Enter Password',
                    obscure: AppBloc.get(context).obscure,
                    icon: IconButton(
                      icon: AppBloc.get(context).obscure == false
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      color: kPrimaryColor,
                      onPressed: () {
                        AppBloc.get(context).changeObscure();
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  ReusableButton(
                    onPressed: () {
                      AppBloc.get(context).login(context);
                    },
                    text: 'Sign In',
                    color: kPrimaryColor,
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
