
import 'package:flutter/material.dart' hide Action, Page;

void routeByPushName(dynamic ctx, String routeName, {arguments}) {
    Navigator.pushNamed(ctx.context, routeName, arguments: arguments);
}

void routeBack(dynamic ctx, String routeName, {arguments}) {
    Navigator.of(ctx.context).pop();
}