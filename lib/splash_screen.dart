import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => store.state.isLogin,
      builder: (BuildContext context, bool isLogin) {
        if (isLogin) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
