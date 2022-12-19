import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Screens/Splash/lyrics_page.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  int value = 6;
  bool musicPaused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ),
              Text(
                'Now Playing',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const Icon(
                Icons.menu,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/guy.png',
                  width: 500,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 470, left: 30, right: 30),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bad Guy',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Billie Eilish',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.favorite_border,
                        size: 38,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Slider(
                    value: value.toDouble(),
                    min: 1.0,
                    max: 20.0,
                    divisions: 5,
                    activeColor: const Color(0xff5c5c5c),
                    inactiveColor: Colors.grey,
                    label: 'Set volume value',
                    onChanged: (double newValue) {
                      setState(() {
                        value = newValue.round();
                      });
                    },
                    // semanticFormatterCallback: (double newValue) {
                    //   return '${newValue.round()} dollars';
                    // })
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text(
                        '2:25',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        '4:02',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/loop.png'),
                      Image.asset('images/prev.png'),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          musicPaused != musicPaused;
                          // });
                        },
                        child: CircleAvatar(
                          radius: 40,
                          child: musicPaused
                              ? const Icon(Icons.pause)
                              : const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 40,
                                ),
                        ),
                      ),
                      Image.asset('images/next.png'),
                      Image.asset('images/rand.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Lyrics(),
                      ),
                    );
                  },
                  child: Container(
                    child: Column(
                      children: const [
                        Icon(Icons.keyboard_arrow_up_rounded),
                        Text(
                          'Lyrics',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
