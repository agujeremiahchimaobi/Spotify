import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Screens/Splash/home_page.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/eish.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'Billie Eilish',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              '2 Albums, 67 Tracks',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Lorem ipsum dolor sit amet, consectetur '
              '\nadipiscing elit. Turpis adipiscing vestibulum orci \nenim, nascetur vitae ',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff838383),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('images/lil.png'),
                          ),
                          const SizedBox(height: 30),
                          const Text('lilbubblegum')
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('images/happy.png'),
                          ),
                          const SizedBox(height: 20),
                          const Text('lilbubblegum')
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('images/lil.png'),
                          ),
                          const SizedBox(height: 30),
                          const Text('lilbubblegum'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Songs',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const Text('See More')
                ],
              ),
            ),
            const CustomPlayList(
                title: 'Don\'t Smile at me', artistName: 'Billie Eilish'),
            const CustomPlayList(
                title: 'lilbubblegum', artistName: 'Billie Eilish'),
            const CustomPlayList(title: 'IRobot', artistName: 'Jon Bellon'),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
