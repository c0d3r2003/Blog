import 'package:blogclub/pages/articles_page.dart';
import 'package:blogclub/pages/home_page.dart';
import 'package:blogclub/pages/profile_page.dart';
import 'package:blogclub/theme.dart';
import 'package:blogclub/widget/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'gallery.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List screen = [
    const HomePage(),
    const ArticlesPage(),
    const Gallery(),
    ProfilePage(),
  ];
  int current = 0;
  final String _iconPath = 'images';

  String tabMenuIcon(String iconName, int number) {
    if (current == number) {
      return '$_iconPath/${iconName}_active.png';
    }
    return '$_iconPath/$iconName.png';
  }

  bool isMenuActive(int number) {
    return current == number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: screen[current],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 82,
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border(top: BorderSide(color: Colors.grey.shade200,width: 0.1))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              MaterialButton(
        onPressed: () {
          setState(() {
            current = 0;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(icon, height: 24),
            Icon(
              Icons.home,
              color: Colors.grey,
              size: 26,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            const SizedBox(height: 6),

          ],
        ),
      ),
              MaterialButton(
        onPressed: () {
          setState(() {
            current = 1;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(icon, height: 24),
            Icon(
              Icons.article,
              color: Colors.grey,
              size: 26,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            const SizedBox(height: 6),

          ],
        ),
      ),
              MaterialButton(
        onPressed: () {
          setState(() {
            current = 2;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(icon, height: 24),
            Icon(
              Icons.image,
              color: Colors.grey,
              size: 26,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            const SizedBox(height: 6),

          ],
        ),
      ),
              MaterialButton(
        onPressed: () {
          setState(() {
            current = 3;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(icon, height: 24),
            Icon(
              Icons.person,
              color: Colors.grey,
              size: 26,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            const SizedBox(height: 6),

          ],
        ),
      ),
            ],
          ),
        ),
      ),
    );
  }
}
