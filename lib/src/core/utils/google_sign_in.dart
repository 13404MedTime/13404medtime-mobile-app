// // ignore_for_file: avoid_catches_without_on_clauses
//
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:google_sign_in/google_sign_in.dart';
//
// class Authentication {
//   static Future<User?> signInWithGoogle({required BuildContext context}) async {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//
//       final GoogleSignIn googleSignIn = GoogleSignIn();
//
//       final GoogleSignInAccount? googleSignInAccount =
//       await googleSignIn.signIn();
//
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//
//         try {
//           final UserCredential userCredential =
//           await auth.signInWithCredential(credential);
//
//           user = userCredential.user;
//         } on FirebaseAuthException catch (e) {
//           if (e.code == 'account-exists-with-different-credential') {
//             // ...
//           } else if (e.code == 'invalid-credential') {
//             // ...
//           }
//         } catch (e) {
//           // ...
//         }
//       }
//     }
//
//
//     return user;
//
// }
