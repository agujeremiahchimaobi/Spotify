import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Screens/Splash/basepage.dart';
import '../Auth_Services/auth_services.dart';
import '../Database/database_services.dart';
import '../Helper/helper.dart';
import '../Widgets/custom_widgets.dart';

class SignIn extends StatefulWidget {
  final Function? toggle;
  const SignIn({super.key, this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
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
        ),
        // const SizedBox(width: 70),
        title: Image.asset(
          'images/logo.png',
          scale: 1.3,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                const CustomRichText(
                  underline: TextDecoration.underline,
                  leading: 'If you need any support ',
                  trailing: 'ClickHere',
                  trailingColor: Colors.green,
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hint: 'Enter Username or Email',
                  // onChanged: (value) {
                  //   setState(() {
                  //     email = value;
                  //   });
                  // },
                  controller: email,
                  validator: (value) =>
                      value != null && EmailValidator.validate(value)
                          ? null
                          : 'please enter a valid email',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: 'Password',
                  // onChanged: (value) {
                  //   setState(() {
                  //     password = value;
                  //   });
                  // },
                  controller: password,
                  suffix: const Icon(
                    Icons.visibility_off_outlined,
                  ),
                  validator: (value) => value != null && value.length! >= 6
                      ? null
                      : 'Password must be at least 6 characters',
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recovery password',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                CupertinoButton.filled(
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Sign In'),
                  onPressed: () {
                    login();
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      child: Divider(thickness: 2),
                    ),
                    SizedBox(width: 10),
                    Text('Or'),
                    SizedBox(width: 10),
                    Flexible(
                      child: Divider(thickness: 2),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/google.png'),
                    const SizedBox(width: 50),
                    Image.asset('images/apple.png')
                  ],
                ),
                const SizedBox(height: 80),
                CustomRichText(
                  leading: 'Not A Member ? ',
                  trailing: 'Register Now',
                  trailingColor: Colors.blue,
                  ontap: () {
                    // Navigator.push(
                    //   context,
                    //   CupertinoPageRoute(
                    //     builder: (context) =>  SignUp(),
                    //   ),
                    // );
                    widget.toggle!();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
    }
    await authService.login(email.text.trim(), password.text.trim()).then(
      (value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uId: FirebaseAuth.instance.currentUser!.uid)
                  .getUserdata(email.text.trim());
          // saving the values to shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email.text.trim());
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
          if (!mounted) {
            return;
          }
          Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => const BasePage(),
            ),
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration:  Duration(seconds: 5),
              backgroundColor: Colors.green,
              content: Text('Logged In Successfully'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 5),
              backgroundColor: Colors.red,
              content: Text(value),
            ),
          );
          setState(
            () {
              isLoading = false;
            },
          );
        }
      },
    );
  }
}
