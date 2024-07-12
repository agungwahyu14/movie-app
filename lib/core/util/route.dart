// app_routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie/presentation/pages/home_page.dart';
import 'package:flutter_movie_app/movie/presentation/pages/profile_page.dart';

import '../../movie/presentation/pages/downloads_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case '/download':
      return MaterialPageRoute(builder: (_) => const DownloadsPage());
    case '/profile':
      return MaterialPageRoute(builder: (_) => const ProfilePage());
    // Add more cases as needed for other routes
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
