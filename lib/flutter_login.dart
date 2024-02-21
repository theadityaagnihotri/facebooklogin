import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<void> signInWithFacebook() async {
  try {
    // Trigger the Facebook login flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Check if the user successfully authenticated
    if (result.status == LoginStatus.success) {
      // Retrieve the Facebook access token
      final AccessToken accessToken = result.accessToken!;

      // Pass the access token to Firebase to authenticate
      final AuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      // Sign in to Firebase with the Facebook credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the next screen or perform any other actions
      // after successful authentication
    } else {
      // Handle the error or cancelation
      print('Facebook login canceled or failed.');
    }
  } catch (e) {
    // Handle other errors
    print('Error signing in with Facebook: $e');
  }
}
