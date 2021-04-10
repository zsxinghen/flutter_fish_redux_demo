import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction {
  onToFirstPage,
  onToSecondPage,
  onToThirdPage,
}

class HomeActionCreator {
  static Action toFirstPage() {
    return const Action(HomeAction.onToFirstPage);
  }
   static Action toSecondPage() {
    return const Action(HomeAction.onToSecondPage);
  }
   static Action toThirdPage() {
    return const Action(HomeAction.onToThirdPage);
  }
}
