import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> genres;
  final String selectedGenre;
  final void Function(String?) onChanged;

  const CustomDropdown({
    Key? key,
    required this.genres,
    required this.selectedGenre,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.black,
          value: widget.selectedGenre,
          onChanged: widget.onChanged,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          style: const TextStyle(color: Colors.white),
          items: widget.genres.map((String genre) {
            return DropdownMenuItem<String>(
              value: genre,
              child: Text(genre,
                  style: const TextStyle(color: Colors.white, fontSize: 15)),
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: Center(
        child: CustomDropdown(
          genres: ['Action', 'Comedy', 'Drama', 'Horror', 'Sci-Fi'],
          selectedGenre: 'Action',
          onChanged: (String? newGenre) {
            // Handle genre change
          },
        ),
      ),
    ),
  ));
}
