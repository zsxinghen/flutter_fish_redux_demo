import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo/routers/index.dart';
import 'package:flutter_demo/routers/router_util.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
  });
}

void _onToFirstPage(Action action, Context<HomeState> ctx) {
  routeByPushName(ctx, RouteConfig.homePage, arguments: action.payload);
}

void _onToSecondPage(Action action, Context<HomeState> ctx) {
  routeByPushName(ctx, RouteConfig.homePage, arguments: action.payload);
}

void _onToThirdPage(Action action, Context<HomeState> ctx) {
  routeByPushName(ctx, RouteConfig.homePage, arguments: action.payload);
}