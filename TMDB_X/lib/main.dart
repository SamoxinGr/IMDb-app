// This contains a dummy entry point, and is opted out
// @dart=2.17.6
import 'package:flutter/material.dart';
import 'package:tmdb_x/src/pages/root_page/root_page.dart';
import 'package:tmdb_x/src/pages/open_page/open_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TMDB',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          backgroundColor: Colors.amber,
        ),
        home: RootPage() //LoginPageWidget()
        );
  }
}
