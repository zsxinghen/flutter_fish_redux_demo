import 'package:fish_redux/fish_redux.dart';

import 'list_item_component/component.dart';
import 'state.dart';



class ListItemAdapter extends SourceFlowAdapter<FirstState> {
  static const String itemName = "列表样式1";
  ListItemAdapter() : super(pool: <String, Component<Object>>{
   itemName : ListItemComponent()
  });
}
