import 'package:fish_redux/fish_redux.dart';

class ListItemState implements Cloneable<ListItemState> {

  @override
  ListItemState clone() {
    return ListItemState();
  }
}

ListItemState initState(Map<String, dynamic> args) {
  return ListItemState();
}
