import 'package:flutter/material.dart';

void main() => runApp(const MainPage());



class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Club',
      home: Material(),git
    );
  }
}
