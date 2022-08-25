import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indomie_login/core/model/Employee.dart';
import 'package:indomie_login/core/util/bloc/app/states.dart';
import 'package:indomie_login/features/home/page/home_page.dart';
import 'package:indomie_login/network/dio_helper.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true;

  void changeObscure() {
    if (obscure == false) {
      obscure = true;
    } else {
      obscure = false;
    }
    emit(AppChangeObscure());
  }

  void login(context){
    DioHelper.getData(
        url:
        "/login?user=${username.text}&password=${password.text}")
        .then((value) => {
      if (value.toString().contains('DioErrorType.response'))
        {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Wrong Username or Password')))
        }
      else if (value != null)
        {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Signing In'))),
          getData(),
          Navigator.of(context).pushNamed(HomePage.ID)
        }
    });
    emit(AppLogin());
  }

  Employee? employee;

  void getData()async {
    await DioHelper.getData(url: "/master/?emp_id=100").then((value) =>
    {
    employee = Employee.fromJson(value),

    emit(AppGetData())
    });
  }
}