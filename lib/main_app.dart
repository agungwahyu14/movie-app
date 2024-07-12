import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/movie/presentation/pages/home_page.dart';

import 'core/util/injection.dart';
import 'core/util/route.dart';
import 'movie/presentation/bloc/Coming_movie/Coming_movie_event.dart';
import 'movie/presentation/bloc/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'movie/presentation/bloc/coming_movie/coming_movie_bloc.dart';
import 'movie/presentation/bloc/popular_movie/popular_movie_bloc.dart';
import 'movie/presentation/bloc/popular_movie/popular_movie_event.dart';
import 'movie/presentation/bloc/trending_movie/trending_movie_bloc.dart';
import 'movie/presentation/bloc/trending_movie/trending_movie_event.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<ComingMoviesBloc>()..add(FetchComingMovies()),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(), // Add NavigationBloc
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute:
            generateRoute, // Use generateRoute from app_routes.dart
        initialRoute: '/',
        home: const HomeScreen(),
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);
          final scale = mediaQuery.textScaleFactor.clamp(1.0, 1.2);
          return MediaQuery(
            data: mediaQuery.copyWith(textScaleFactor: scale),
            child: child!,
          );
        },
      ),
    );
  }
}
