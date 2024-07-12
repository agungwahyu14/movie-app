import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/presentation/widgets/custom_appbar.dart';
import 'package:flutter_movie_app/core/presentation/widgets/custom_bottom_navigation.dart';
import 'package:flutter_movie_app/movie/presentation/widgets/form_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
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
        child: Center(
          child: ProfileForm(),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
