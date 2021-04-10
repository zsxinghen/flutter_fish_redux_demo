import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/routers/index.dart';
import 'package:flutter_demo/routers/router_util.dart';
import 'action.dart';
import 'state.dart';

Effect<FirstState> buildEffect() {
  return combineEffects(<Object, Effect<FirstState>>{
    FirstAction.onBackHome: _onBackHome,
  });
}

void _onBackHome(Action action, Context<FirstState> ctx) {
  routeByPushName(ctx, RouteConfig.homePage, arguments: action.payload);
}
