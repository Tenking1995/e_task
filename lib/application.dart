import 'package:flutter/material.dart';

enum PageTransitionType {
  fadeIn,
  scale,
  rightToLeftWithFade,
  leftToRightWithFade,
}

class Application {
  static PageTransitionType defaultPageTransition = PageTransitionType.rightToLeftWithFade;
  static Duration defaultPageTransitionStartDuration = const Duration(milliseconds: 200);

  static void pushNameWithTransition(
    BuildContext context,
    String routeName, {
    Object? arguments,
    PageTransitionType? transition,
    Duration? duration,
  }) {
    defaultPageTransition = transition ?? PageTransitionType.rightToLeftWithFade;
    defaultPageTransitionStartDuration = duration ?? const Duration(milliseconds: 200);
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static Widget getDefaultPageTransition(Animation<double> animation, Widget child) {
    switch (defaultPageTransition) {
      case PageTransitionType.fadeIn:
        return FadeTransition(opacity: animation, child: child);
      case PageTransitionType.rightToLeftWithFade:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease)).animate(animation),
          child: child,
        );
      case PageTransitionType.leftToRightWithFade:
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease)).animate(animation),
          child: child,
        );
      case PageTransitionType.scale:
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        );
    }
  }
}
