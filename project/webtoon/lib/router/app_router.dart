import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail/screen.dart';
import 'package:webtoon/screens/home/screen.dart';

enum AppRoutePath {
  home,
  detail,
}

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> routes = {
    AppRoutePath.home.name: (context) => HomeScreen(),
    AppRoutePath.detail.name: (context) => DetailScreen(),
  };

  static Route _buildRouteAnimation({
    required BuildContext context,
    required AppRoutePath to,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          routes[to.name]!(context),
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        const beginPosition = Offset(1, 0);
        const end = Offset(0, 0);
        const curve = Curves.ease;

        final tween = Tween(begin: beginPosition, end: end).chain(
          CurveTween(
            curve: curve,
          ),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static String initialRoute = AppRoutePath.home.name;

  static void move<RoutingProps extends Object>({
    required BuildContext context,
    required AppRoutePath to,
    RoutingProps? routingProps,
  }) {
    Navigator.pushNamed(
      context,
      to.name,
      arguments: routingProps,
    );
  }

  static void moveWithAnimation<RoutingProps extends Object>({
    required BuildContext context,
    required AppRoutePath to,
    RoutingProps? routingProps,
  }) {
    Navigator.of(context).push(
      _buildRouteAnimation(
        context: context,
        to: to,
      ),
    );
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
