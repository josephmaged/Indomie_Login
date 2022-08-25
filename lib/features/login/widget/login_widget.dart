import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:indomie_login/config/const.dart';
import 'package:indomie_login/core/model/Employee.dart';
import 'package:indomie_login/features/home/page/home_page.dart';
import 'package:indomie_login/features/widgets/reusable_button.dart';
import 'package:indomie_login/features/widgets/reusable_text.dart';
import 'package:indomie_login/features/widgets/reusable_textfield.dart';
import 'package:indomie_login/network/dio_helper.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
bool obscure = true;

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

List<Employee> parseEmployee(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
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
                text: username,
                hintText: 'User Name',
                errorText: 'Please Enter User Name',
                obscure: false,
              ),
              const SizedBox(height: 25),
              const ReusableText(text: 'Password'),
              const SizedBox(height: 15),
              ReusableTextField(
                text: password,
                hintText: 'Password',
                errorText: 'Please Enter Password',
                obscure: obscure,
                icon: IconButton(
                  icon: obscure == false ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                  color: kPrimaryColor,
                  onPressed: () {
                    setState(() {
                      if (obscure == false) {
                        obscure = true;
                      } else {
                        obscure = false;
                      }
                    });
                  },
                ),
              ),
              const SizedBox(height: 40),
              ReusableButton(
                onPressed: () {
                  DioHelper.getData(url: "/login?user=${username.text}&password=${password.text}").then((value) => {
                        if (value.toString().contains('DioErrorType.response'))
                          {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('Username or Password is incorrect')))
                          }
                        else if (value != null)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Signing In'))),
                            DioHelper.getData(url: "/master/?emp_id=100").then((value) => {
                                  parseEmployee(value.toString()),
                                }),
                            Navigator.of(context).pushNamed(HomePage.ID)
                          }
                      });
                },
                text: 'Sign In',
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
