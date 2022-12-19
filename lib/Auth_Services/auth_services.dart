import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/Database/database_services.dart';

import '../Helper/helper.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future register(String email, String password, String fullName) async {
    try {
      User? user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        await DatabaseService(uId: user.uid).saveUserData(email, fullName);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }
  }

  Future login(String email, String password) async {
    try {
      User? user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.message == 'user-not-found') {
        print('user not found');
      }
      print(e);
      return e.message;
    }
  }

  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF('');
      await HelperFunctions.saveUserNameSF('');
      await auth.signOut();
    } catch (e) {}
  }
}
