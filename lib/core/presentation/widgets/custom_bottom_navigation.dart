import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movie/presentation/bloc/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../../../movie/presentation/bloc/bottom_navigation/bloc/bottom_navigation_event.dart';
import '../../../movie/presentation/bloc/bottom_navigation/bloc/bottom_navigation_state.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Container(
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationIndexChanged(0));
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home,
                        color: state.currentIndex == 0
                            ? Colors.white
                            : Colors.grey),
                    const SizedBox(height: 4),
                    Text('Home',
                        style: TextStyle(
                            color: state.currentIndex == 0
                                ? Colors.white
                                : Colors.grey)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationIndexChanged(1));
                  Navigator.pushReplacementNamed(context, '/download');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.download,
                        color: state.currentIndex == 1
                            ? Colors.white
                            : Colors.grey),
                    const SizedBox(height: 4),
                    Text('Downloads',
                        style: TextStyle(
                            color: state.currentIndex == 1
                                ? Colors.white
                                : Colors.grey)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationIndexChanged(2));
                  Navigator.pushReplacementNamed(context, '/profile');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person,
                        color: state.currentIndex == 2
                            ? Colors.white
                            : Colors.grey),
                    const SizedBox(height: 4),
                    Text('Profile',
                        style: TextStyle(
                            color: state.currentIndex == 2
                                ? Colors.white
                                : Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
