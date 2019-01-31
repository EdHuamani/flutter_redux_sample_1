import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  void _goDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => StoreBuilder<AppState>(
              builder: (context, vm) => DetailScreen(),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Welcome to redux'),
            actions: <Widget>[
              IconButton(
                onPressed: vm.onLogout,
                icon: Icon(Icons.exit_to_app),
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${vm.counter}',
                  style: Theme.of(context).textTheme.display1,
                ),
                RaisedButton(
                  child: Text('Go detail page'),
                  onPressed: () => _goDetail(context),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: vm.onIncrement,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  _ViewModel({this.counter, this.onIncrement, this.onLogout});

  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onLogout;
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      counter: store.state.counter,
      onIncrement: () => store.dispatch(IncrementCounterAction),
      onLogout: () => store.dispatch(LogoutAction),
    );
  }
}
