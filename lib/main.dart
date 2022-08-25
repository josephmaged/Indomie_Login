import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indomie_login/core/util/bloc/app/cubit.dart';
import 'package:indomie_login/features/home/page/home_page.dart';
import 'package:indomie_login/features/login/page/login_screen.dart';
import 'package:indomie_login/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
        title: 'Employee',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          LoginScreen.ID: (context) => const LoginScreen(),
          HomePage.ID: (context) => const HomePage(),
        },
        home: const LoginScreen(),
      ),
    );
  }
}
