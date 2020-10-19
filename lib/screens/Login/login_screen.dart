import 'dart:developer';
import 'dart:io';

import 'package:CT_Covid/controller/login/login_controller.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:CT_Covid/Screens/Login/components/body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = LoginController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<LoginController>(
      create: (context) => _loginController,
      child: BlocListener<LoginController, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            String title = 'Info';
            showDialog(
              context: context,
              builder: (context) {
                if (Platform.isIOS) {
                  return CupertinoAlertDialog(
                    title: Text(title),
                    content: Text(state.error),
                  );
                } else {
                  return AlertDialog(
                    title: Text(title),
                    content: Text(state.error),
                  );
                }
              },
            );
          } else if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/dashboard_screen', (r) => false);
          }
        },
        child: Container(
            child: Stack(children: <Widget>[
          Body(),
          BlocBuilder<LoginController, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                log('data: loading');
              } else {
                return Container();
              }
            },
          )
        ])),
      ),
    ));
  }
}
