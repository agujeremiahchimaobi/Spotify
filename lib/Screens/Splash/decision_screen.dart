import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Auth/authenticate.dart';
import 'package:spotify/Auth/signin_screen.dart';
import 'package:spotify/Auth/signup_screen.dart';
import 'package:spotify/Widgets/custom_widgets.dart';

class Decision extends StatelessWidget {
  const Decision({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('images/decision.png')),
          Column(
            children: [
              const SizedBox(height: 120),
              Center(
                child: Image.asset(
                  'images/logo.png',
                  scale: 0.8,
                ),
              ),
              const SizedBox(height: 70),
              Text(
                'Enjoy listening to music',
                style: GoogleFonts.aclonica(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                'Spotify is a proprietary'
                ' Swedish audio\n streaming and media services provider',
                style: GoogleFonts.poppins(
                  color: const Color(0xff797979),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 30),
                  CupertinoButton(
                      color: Colors.green,
                      minSize: 60,
                      child: const Text('Register'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const Authenticate(),
                          ),
                        );
                      }),
                  const Spacer(),
                  CupertinoButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const Authenticate(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 60)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
