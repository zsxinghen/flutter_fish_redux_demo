import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(FirstState state, Dispatch dispatch, ViewService viewService) {
  return _showList(state, viewService);
}

Widget _showList(FirstState state, ViewService viewService) {
  if (state.items != null) {
    ///使用列表
    return ListView.builder(
      itemBuilder: viewService.buildAdapter().itemBuilder,
      itemCount: viewService.buildAdapter().itemCount,
    );
  } else {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}