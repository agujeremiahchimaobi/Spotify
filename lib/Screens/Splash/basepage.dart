import 'package:flutter/material.dart';
import 'package:spotify/Screens/Splash/artist_page.dart';
import 'package:spotify/Screens/Splash/home_page.dart';
import 'package:spotify/Screens/Splash/profile_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          renderView(0, const HomePage()),
          renderView(1, Container(color: Colors.red)),
          renderView(2, const ArtistPage()),
          renderView(3, const Profile()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

          backgroundColor: Colors.white,
          iconSize: 40,
          selectedItemColor: Colors.green,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('images/home.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('images/set.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('images/love.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('images/profile.png'),
                ),
                label: ''),
          ]),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: selectedIndex != tabIndex,
      child: Opacity(
        opacity: selectedIndex == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
