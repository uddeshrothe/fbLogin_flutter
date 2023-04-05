
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google sign in
  signInWithGoogle() async {
    // initial sign in progress
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //Get auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
