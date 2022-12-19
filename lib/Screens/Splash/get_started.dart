import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Screens/Splash/choose_mode.dart';
import 'package:spotify/Screens/Splash/decision_screen.dart';

import '../../Widgets/custom_widgets.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/getstart.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(height: 430),
              Text(
                'Enjoy Listening To Music',
                style: GoogleFonts.aclonica(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Lorem ipsum dolor sit amet, \nconsectetur adipiscing'
                ' elit. Sagittis enim \npurus sed phasellus. '
                'Cursus ornare id scelerisque aliquam.',
                style: GoogleFonts.poppins(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              CupertinoButton.filled(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const Decision(),
                    ),
                  );
                },
                minSize: 60,
                child: const Text('Get Started'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
