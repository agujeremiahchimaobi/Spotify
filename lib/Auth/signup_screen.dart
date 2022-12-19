import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/Auth/signin_screen.dart';
import 'package:spotify/Screens/Splash/basepage.dart';
import 'package:spotify/Screens/Splash/home_page.dart';

import '../Auth_Services/auth_services.dart';
import '../Helper/helper.dart';
import '../Widgets/custom_widgets.dart';

class SignUp extends StatefulWidget {
  final Function? toggle;
  const SignUp({Key? key, this.toggle}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  late bool isLoading = false;
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
                  'Register',
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
                  hint: 'Full Name',
                  // onChanged: (value) {
                  //   setState(() {
                  //     fullName = value;
                  //   });
                  // },
                  controller: fullName,
                  validator: (value) =>
                      value.isNotEmpty ? null : 'Please Enter a Username',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: 'Enter Email',
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
                const SizedBox(height: 25),
                CupertinoButton.filled(
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Create account'),
                  onPressed: () {
                    register();
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(child: Divider(thickness: 2)),
                    SizedBox(width: 10),
                    Text('Or'),
                    SizedBox(width: 10),
                    Flexible(child: Divider(thickness: 2)),
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
                const SizedBox(height: 50),
                CustomRichText(
                  leading: 'Do You have An Account ? ',
                  trailing: 'Sign In',
                  trailingColor: Colors.blue,
                  ontap: () {
                    widget.toggle!();
                  },
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService.register(email.text.trim(), password.text.trim(), fullName.text.trim()).then((value) async {
        if (value == true) {
          // save shared preferences data
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email.text.trim());
          await HelperFunctions.saveUserNameSF(fullName.text.trim());
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
              duration: Duration(seconds: 5),
              backgroundColor: Colors.green,
              content: Text('Signed Up Successfully'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(value),
            ),
          );
          setState(
            () {
              isLoading = true;
            },
          );
        }
      });
    }
  }
}
