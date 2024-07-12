import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/custom_bottom_navigation.dart';

import '../bloc/popular_movie/popular_movie_bloc.dart';
import '../bloc/popular_movie/popular_movie_state.dart';

import 'movie_list.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({Key? key}) : super(key: key);

  @override
  State<PopularMovie> createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation to different tabs here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.red,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NITFLIX',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red, // starting color
              Colors.black.withOpacity(0.9), // ending color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.7], // gradient stops
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state) {
                  if (state is PopularMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is PopularMoviesLoaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is PopularMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
