import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/presentation/widgets/custom_appbar.dart';
import 'package:flutter_movie_app/core/presentation/widgets/custom_bottom_navigation.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Downloads'),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.download,
                size: 100,
                color: Colors.white.withOpacity(0.8),
              ),
              const SizedBox(height: 20),
              const Text(
                'Downloads Page',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implementasikan aksi untuk mengunduh item di sini
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Background color
                  onPrimary: Colors.white, // Text color
                ),
                child: const Text('Download New Item'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
