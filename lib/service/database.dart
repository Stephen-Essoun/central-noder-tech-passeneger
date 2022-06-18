import 'package:cloud_firestore/cloud_firestore.dart';

class DbService{
  final CollectionReference userollection = FirebaseFirestore.instance.collection('yenko_user');

   String? uid ;

  Future updateUser ({required String firstname,required String surname,required String email,required String phoneNumber})async{
    await userollection.doc(uid).set({
      'Name':'$firstname,$surname',
      'Email':email,
      'Phone Number':phoneNumber
      
    });
  }
}