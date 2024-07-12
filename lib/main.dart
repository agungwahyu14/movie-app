import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/util/injection.dart';

import 'main_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locatorInit();
  runApp(const MainApp());
}
