import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/pages/first_page/adapter.dart';
import 'package:flutter_demo/store/state.dart';

import 'list_item_component/state.dart';

class FirstState extends MutableSource implements Cloneable<FirstState>, GlobalBaseState {
  List<ListItemState> items;
  @override
  FirstState clone() {
    return FirstState()
      ..items = items
      ..store = store;
  }

  @override
  Object getItemData(int index) => items[index];

  @override
  String getItemType(int index) => ListItemAdapter.itemName;

  @override
  int get itemCount => items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }

  @override
  StoreModel store;
}

FirstState initState(Map<String, dynamic> args) {
  return FirstState();
}
