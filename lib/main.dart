import 'package:flutter/material.dart';

import 'package:CT_Covid/screens/Welcome/welcome_screen.dart';
import 'package:CT_Covid/constants.dart';
import 'package:CT_Covid/injector/injector.dart';
import 'package:CT_Covid/storage/sharedpreferences/shared_preferences_manager.dart';
import 'package:CT_Covid/screens/Login/login_screen.dart';
import 'package:CT_Covid/screens/Signup/signup_screen.dart';
import 'package:CT_Covid/screens/Dashboard/dashboard_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(MyApp());
  } catch (error, stacktrace) {
    print('$error & $stacktrace');
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final SharedPreferencesManager _sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  @override
  Widget build(BuildContext context) {
    bool _isAlreadyLoggedIn = _sharedPreferencesManager
            .isKeyExists(SharedPreferencesManager.keyIsLogin)
        ? _sharedPreferencesManager.getBool(SharedPreferencesManager.keyIsLogin)
        : false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CT_Covid',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: _isAlreadyLoggedIn ? DashboardScreen() : WelcomeScreen(),
      routes: {
        '/welcome_screen': (context) => WelcomeScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/signup_screen': (context) => SignUpScreen(),
        '/dashboard_screen': (context) => DashboardScreen(),
      },
    );
  }
}
