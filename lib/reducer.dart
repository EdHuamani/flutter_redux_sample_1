import 'actions.dart';
import 'app_state.dart';

AppState appReducer(AppState store, dynamic action) {
  return AppState(
    counter: counterReducer(store.counter, action),
    isLogin: isLoginReducer(store.isLogin, action),
  );
}

int counterReducer(int state, dynamic action) {
  if (action == IncrementCounterAction) {
    return state + 1;
  }
  return state;
}

bool isLoginReducer(bool state, dynamic action) {
  if (action == LoginAction) {
    return true;
  }
  if(action == LogoutAction){
    return false;
  }
  return state;
}
