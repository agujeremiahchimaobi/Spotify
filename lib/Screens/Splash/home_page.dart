import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Screens/Splash/artist_page.dart';
import 'package:spotify/Screens/Splash/music_page.dart';

import '../../Widgets/custom_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.search_rounded,
          size: 40,
          color: Colors.grey,
        ),
        title: Image.asset(
          'images/logo.png',
          scale: 1.6,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.menu_outlined, color: Colors.grey),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, top: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'wanna be',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text(
                          'Happier Than \nEver',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'by chima agu',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      '🥰',
                      style: TextStyle(fontSize: 60),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            child: TabBar(
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontSize: 18),
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              isScrollable: true,
              controller: tabController,
              indicatorPadding: const EdgeInsets.only(left: 30),
              labelPadding: const EdgeInsets.only(left: 30),
              tabs: const [
                Tab(text: 'News'),
                Tab(text: 'Video'),
                Tab(text: 'Artist'),
                Tab(text: 'Podcasts'),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(left: 30),
            width: double.infinity,
            height: 280,
            child: TabBarView(
              physics:
                  const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              controller: tabController,
              children: [
                ListView(scrollDirection: Axis.horizontal, children: [
                  CustomNews(
                    title: 'Bad Guy',
                    image: 'images/badguy.png',
                    artistName: 'Billie Eilish',
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const MusicPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 15),
                  const CustomNews(
                      title: 'Scorpion',
                      image: 'images/scorpion.png',
                      artistName: 'Drake'),
                  const SizedBox(width: 15),
                  const CustomNews(
                      title: 'WHITE',
                      image: 'images/scorpion.png',
                      artistName: 'Billie Eilish'),
                ]),
                const Text('data'),
                Container(
                  child: ListView(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const ArtistPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Eish',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          )),
                      Text('BurnaBoy',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      Text('Davido',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      Text(
                        'Drake',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text('Dj Khalid',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      Text('Wizkid',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      Text('Chioma Jesus',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      Text('Able Keme😂',
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                const Text('chima')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Row(
              children: [
                Text(
                  'PlayList',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(
                  'See More',
                  style: GoogleFonts.poppins(fontSize: 12),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          const CustomPlayList(
            title: 'As it Was',
            artistName: 'Harry Styles',
          ),
          const CustomPlayList(
            title: 'God Did',
            artistName: 'DJ Khalid',
          )
        ],
      ),
    );
  }
}

class CustomPlayList extends StatelessWidget {
  const CustomPlayList({
    Key? key,
    required this.title,
    required this.artistName,
  }) : super(key: key);

  final String title;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          const CustomPlayBtn(),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                artistName,
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          const Text('5:33'),
          const SizedBox(width: 40),
          const Icon(
            Icons.favorite,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
