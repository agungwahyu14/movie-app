import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/core/presentation/widgets/custom_category_dropdown.dart';

import '../../../core/presentation/widgets/custom_bottom_navigation.dart';
import '../bloc/Coming_movie/Coming_movie_state.dart';
import '../bloc/coming_movie/coming_movie_bloc.dart';
import '../bloc/popular_movie/popular_movie_bloc.dart';
import '../bloc/popular_movie/popular_movie_state.dart';
import '../bloc/trending_movie/trending_movie_bloc.dart';
import '../bloc/trending_movie/trending_movie_state.dart';
import '../widgets/movie_slider.dart';
import 'movie_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> genres = [
    'Genre',
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Sci-Fi'
  ];
  String selectedGenre = 'Genre';

  void _onGenreChanged(String? newGenre) {
    setState(() {
      selectedGenre = newGenre!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.red,
        title: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            'NITFLIX',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomDropdown(
                  genres: genres,
                  selectedGenre: selectedGenre,
                  onChanged: _onGenreChanged,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending Movies',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_right, color: Colors.white)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                builder: (context, state) {
                  if (state is TrendingMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is TrendingMoviesLoaded) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 450,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                      ),
                      items: state.movies.map((movie) {
                        return Builder(
                          builder: (BuildContext context) {
                            return MovieSlider(
                                movie); // Replace with appropriate widget
                          },
                        );
                      }).toList(),
                    );
                  } else if (state is TrendingMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Movies',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_right, color: Colors.white)
                    ],
                  ),
                ),
              ),
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Coming Soon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_right, color: Colors.white)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              BlocBuilder<ComingMoviesBloc, ComingMoviesState>(
                builder: (context, state) {
                  if (state is ComingMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ComingMoviesLoaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is ComingMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
