import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController implements GetxService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late GoogleSignInAccount googleAccount;
  late GoogleSignInAuthentication auth;

  Future<void> login() async {
    googleAccount = (await _googleSignIn.signIn())!;
    auth = await googleAccount.authentication;
    update();
  }

  logout() async {
    googleAccount = (await _googleSignIn.signOut())!;
    update();
  }
}
