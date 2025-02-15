import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_session/home_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  void signup(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential);
      print("User created");
      Get.to(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar('The password provided is too weak', "");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar('The account already exists for that email.', "");
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar('No user found for that email.', "");
      } else if (e.code == 'invalid-credential') {
        print('Wrong password provided for that user.');
        Get.snackbar('Wrong password provided for that user.', "");
      }
      print("🚀🚀🚀🚀🚀");
      print(e.code);
    } catch (e) {
      print("🚀🚀🚀🚀🚀");
      print(e);
    }
  }
}
