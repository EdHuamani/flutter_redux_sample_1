import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StoreConnector(converter: (Store<AppState> store) {
        return () => store.dispatch(LoginAction);
      }, builder: (BuildContext context, VoidCallback callback) {
        return RaisedButton(
          onPressed: callback,
          child: Text('Login'),
        );
      })),
    );
  }
}
