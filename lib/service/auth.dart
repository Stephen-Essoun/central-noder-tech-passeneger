
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
 final  String verificationIdRecieved = '';

 
  
  void verifyNumber({required String phone}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber:( '+233$phone'),
        timeout: const Duration(seconds: 20),
        verificationCompleted: (PhoneAuthCredential credential) {
        
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationId=verificationIdRecieved;
          
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          
        });
  }

  void verifyOtpCode({required String smscode}) async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationIdRecieved, smsCode:smscode );
    await _auth.signInWithCredential(credential).then((value) {
      print('successful logIn');
    });
  }
}
