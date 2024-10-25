import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Constructor to check if the user is already signed in
  FirebaseAuthService() {
    checkUserSignInStatus();
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user; // Return the user object
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Check if the user is already signed in
  void checkUserSignInStatus() {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      print("User is already signed in as ${currentUser.displayName}");
      // Optionally, you can load the user into the app state here.
    }
  }

  // Sign out from Google and Firebase
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Method to listen to changes in the user's sign-in state
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
