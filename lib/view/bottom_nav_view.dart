import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/favorite_view.dart';
import 'package:flutter_application_2/view/home_view.dart';
import 'package:flutter_application_2/view/registration_view.dart';
import 'package:flutter_application_2/view/search_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  final bottomNotifier = ValueNotifier(0);

  final screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    RegistrationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.grid_view_outlined, size: 28),
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: bottomNotifier,
        builder: (context, page, child) {
          return screens[page];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: bottomNotifier,
          builder: (context, index, child) {
            return GNav(
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.search_rounded, text: 'Search'),
                GButton(icon: Icons.favorite_border, text: 'Favorite'),
                GButton(icon: Icons.person, text: 'Register'),
              ],
              padding: const EdgeInsets.all(15),
              tabMargin: const EdgeInsets.all(5),
              activeColor: Colors.white,
              style: GnavStyle.google,
              tabBackgroundColor: Colors.black,
              selectedIndex: index,
              onTabChange: (value) {
                bottomNotifier.value = value;
              },
            );
          }),
    );
  }
}
