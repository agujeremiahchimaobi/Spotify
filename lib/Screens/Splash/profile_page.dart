import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Auth/authenticate.dart';
import 'package:spotify/Auth_Services/auth_services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: CupertinoButton(
          color: Colors.green,
          child: const Text('Log Out'),
          onPressed: () {
            showCupertinoDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Log Out'),
                  content: const Text(
                    'Are you sure you want to log out?',
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('NO'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        authService.signOut().then(
                          (value) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const Authenticate(),
                              ),
                              (route) => false,
                            );
                          },
                        );
                      },
                      child: const Text('YES'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
