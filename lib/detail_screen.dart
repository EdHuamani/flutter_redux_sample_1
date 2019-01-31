import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'The Widget will automatically be rebuilt.',
              style: Theme.of(context).textTheme.overline,
            ),
            StoreConnector(
              converter: (Store<AppState> store) => store.state.counter,
              builder: (BuildContext context, int counter) => Text(
                    '$counter',
                    style: Theme.of(context).textTheme.display4,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
