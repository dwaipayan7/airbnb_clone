import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService{

  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  signInWithGoogle() async{
    try{

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );

        await auth.signInWithCredential(credential);


      }

    }on FirebaseAuthException catch(e){
        print(e.toString());
    }
  }
}