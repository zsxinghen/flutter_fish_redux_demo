import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum FirstAction { onBackHome }

class FirstActionCreator {
  static Action backHome(dynamic argument) {
    return Action(FirstAction.onBackHome,payload: argument);
  }
}
