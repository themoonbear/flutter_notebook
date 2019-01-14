import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder {
  final Widget _widget;
  
  CustomRoute(this._widget):super(
    transitionDuration: Duration(seconds: 1),
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ) {
      return _widget;
    },
    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child
    ){
      // return FadeTransition(
      //   opacity: Tween(begin: 0.0, end: 1.0)
      //   .animate(CurvedAnimation(
      //     parent: animation1,
      //     curve: Curves.fastOutSlowIn
      //   )),
      //   child: child,
      // );
      // 缩放的动画
      // return ScaleTransition(
      //   scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //     parent: animation1,
      //     curve: Curves.fastOutSlowIn)),
      //     child: child,
      // );
      //旋转+缩放
      // return RotationTransition(
      //   turns: Tween(begin: 0.0, end: 1.0).animate(
      //     CurvedAnimation(
      //       parent: animation1,
      //       curve: Curves.fastOutSlowIn
      //     )),
      //     child: ScaleTransition(
      //       scale: Tween(begin: 0.0, end: 1.0)
      //       .animate(CurvedAnimation(
      //         parent: animation1,
      //         curve: Curves.fastOutSlowIn
      //       )),
      //       child: child,
      //     ),
      // );
      //滑动
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0, 0.0), 
          end: Offset(0.0, 0.0)
        ).animate(CurvedAnimation(
          parent: animation1,
          curve: Curves.elasticIn)),
        child: child,
      );
    }
  );
}