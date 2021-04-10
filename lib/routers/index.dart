import 'package:fish_redux/fish_redux.dart';
// import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutter_demo/middleware/effect_middleware.dart';

import 'package:flutter_demo/pages/first_page/page.dart';
import 'package:flutter_demo/pages/home_page/page.dart';
import 'package:flutter_demo/pages/second_page/page.dart';
import 'package:flutter_demo/pages/third_page/page.dart';

import 'package:flutter_demo/store/state.dart';
import 'package:flutter_demo/store/store.dart';

class RouteConfig {
  static const String homePage = '/homePage';
  static const String firstPage = '/firstPage';
  static const String secondPage = '/secondPage';
  static const String thirdPage = '/thirdPage';
  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      ///将你的路由名称和页面映射在一起，比如：RouteConfig.homePage : HomePage(),
      RouteConfig.homePage: HomePage(),
      RouteConfig.firstPage: FirstPage(),
      RouteConfig.secondPage: SecondPage(),
      RouteConfig.thirdPage: ThirdPage(),
    },
    visitor: StoreConfig.visitor,
  );
}

class StoreConfig {
  ///全局状态管理
  static _updateState(String path) {
    return (Object pageState, GlobalState appState) {
      final GlobalBaseState p = pageState ;

      if (pageState is Cloneable) {
        final Object copy = pageState.clone();
        final GlobalBaseState newState = copy as GlobalBaseState;

        if (p.store == null) {
          ///这地方的判断是必须的，判断第一次store对象是否为空
          newState.store = appState.store;
        } else {
          /// 这地方增加字段判断，是否需要更新
          if ((p.store.themeColor != appState.store.themeColor)) {
            newState.store.themeColor = appState.store.themeColor;
          }
        }
        return newState;
      }
    };
  }

  static visitor(String path, Page<Object, dynamic> page) {
    if (page.isTypeof<GlobalBaseState>()) {
      ///建立AppStore驱动PageStore的单向数据连接
      ///参数1 AppStore  参数2 当AppStore.state变化时,PageStore.state该如何变化
      page.connectExtraStore<GlobalState>(
          GlobalStore.store, _updateState(path));
    }

    /// AOP
    /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
    /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
    page.enhancer.append(
      /// View AOP
      viewMiddleware: <ViewMiddleware<dynamic>>[
        safetyView<dynamic>(),
      ],

      /// Adapter AOP
      adapterMiddleware: <AdapterMiddleware<dynamic>>[safetyAdapter<dynamic>()],

      /// Effect AOP
      effectMiddleware: <EffectMiddleware<dynamic>>[
        pageAnalyticsMiddleware<dynamic>(),
      ],

      /// Store AOP
      middleware: <Middleware<dynamic>>[
        logMiddleware<dynamic>(tag: page.runtimeType.toString()),
      ],
    );
  }
}
