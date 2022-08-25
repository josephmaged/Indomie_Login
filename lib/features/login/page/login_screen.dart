import 'package:flutter/material.dart';
import 'package:indomie_login/features/login/widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String ID = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginWidget();
  }
}
