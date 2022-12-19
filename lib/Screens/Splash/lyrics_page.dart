import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Lyrics extends StatefulWidget {
  const Lyrics({Key? key}) : super(key: key);

  @override
  State<Lyrics> createState() => _LyricsState();
}

class _LyricsState extends State<Lyrics> {

  int value = 6;
  bool musicPaused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 700,
                child: Image.asset(
                  'images/badguy.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Bad Guy',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      '(Verse 1)',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "Sleepin, you're on your tippy toes Creepin around like no one knows"
                      "Think you're so criminal Bruises on both my knees for you Don't say thank you or please"
                      "I do what I want when I'm wanting to \nMy soul? So cynical",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.grey, height: 1.5),
                      textScaleFactor: 1.3,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      '(Verse 2)',
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "Sleepin', you're on your tippy toes Creepin' around like no one knows"
                      "Think you're so criminal Bruises on both my knees for you Don't say thank you or please"
                      "I do what I want when I'm wanting to My soul? So cynical",
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.grey, height: 1.5),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/badguy.png'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bad Guy',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Billie Eilish',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.favorite_border,
                  size: 30,
                  color: Colors.grey,
                )
              ],
            ),
          ),
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
                        radius: 30,
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
            ],
          ),
        ],
      ),
    );
  }
}
