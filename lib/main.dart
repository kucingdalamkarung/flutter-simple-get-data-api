import 'package:flutter/material.dart';
import 'package:movie_db/pages/home_page.dart';
import 'package:movie_db/utils/layout.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Movie Database App.',
      theme: ThemeData(
        fontFamily: LayoutUtils.fontFamily,
      ),
      home: HomePage(),
    );
  }
}
