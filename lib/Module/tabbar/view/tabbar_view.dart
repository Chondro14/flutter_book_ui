import 'package:flutter/material.dart';
import 'package:flutter_library_book/Module/favorite/view/favorite_view.dart';
import 'package:flutter_library_book/Module/home/view/home_view.dart';

class TabBarDasboardView extends StatefulWidget {
  const TabBarDasboardView({super.key});

  @override
  State<TabBarDasboardView> createState() => _TabBarDasboardViewState();
}

class _TabBarDasboardViewState extends State<TabBarDasboardView> {
  var currentIndex = 0;

  Widget content(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return FavoriteView();
      case 2:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
