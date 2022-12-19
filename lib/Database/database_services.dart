import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  late final String? uId;
  DatabaseService({this.uId});

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future saveUserData(String email, String fullName) async{
    return await collectionReference.doc(uId).set({
      'email': email,
      'fullName': fullName,
      'uId': uId,
    });
  }

  Future getUserdata(String email) async{
   QuerySnapshot querySnapshot = await collectionReference.where('email', isEqualTo: email).get();
   return querySnapshot;
  }
}
