import 'package:flutter/material.dart';
import '../app/layers/presenters/view/details/details_page.dart';
import 'layers/presenters/view/error/error_page.dart';

import 'shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Challenge Flutter',
      theme: DefaultTheme.dark,
      themeMode: ThemeMode.dark,
      highContrastDarkTheme: DefaultTheme.contrast,
      debugShowCheckedModeBanner: false,
      initialRoute: DetailsPage.route,
      onGenerateRoute: (settings) {
        var route = settings.name;
        Widget page;

        switch (route) {
          case DetailsPage.route:
            page = const DetailsPage();
            break;

          case ErrorPage.route:
            page = const ErrorPage();
            break;

          default:
            page = const ErrorPage();
        }

        return PageRouteBuilder(
            maintainState: false,
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, secAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.decelerate);
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );
            });
      },
    );
  }
}
