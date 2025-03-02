import 'package:bunny_ngim_app/view/base/show_custom_snackbar_widget.dart';
import 'package:bunny_ngim_app/view/screen/auth/verify_otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

enum SMSModelState { loading, loaded }

class SMSController extends GetxController implements GetxService {
  var _state = SMSModelState.loaded;
  bool _isLoading = false;
  SMSModelState get state => _state;
  String _verificationId = '';
  String _fullnumber = '';
  String get fullnumber => _fullnumber;
  bool get isLoading => _isLoading;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  setLoading(bool isLoading) {
    _isLoading = isLoading;
    update();
  }

  void _updateState(state) {
    _state = state;
    update();
  }

  Future<void> send(String fullnumber) async {
    _isLoading = true;
    update();
    _fullnumber = fullnumber;
    Get.to(() => VerifyScreen(fullnumber: _fullnumber));
    try {
      _auth.setLanguageCode(Get.locale!.languageCode);
      await _auth.verifyPhoneNumber(
        phoneNumber: fullnumber,
        verificationCompleted: (auth.PhoneAuthCredential credential) async {
          _updateState(SMSModelState.loaded);
        },
        verificationFailed: (auth.FirebaseAuthException e) {
          showCustomSnackBar(e.message!, Get.context!);
        },
        codeSent: (String? verificationId, int? resendToken) {
          _verificationId = verificationId!;
          _isLoading = false;
          update();

          Get.to(() => VerifyScreen(fullnumber: _fullnumber));
        },
        timeout: Duration(seconds: 120),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (error) {
      _updateState(SMSModelState.loaded);
      showCustomSnackBar(error.message!, Get.context!);
    }
    update();
  }

  Future<bool> verify({String? smsCode}) async {
    _isLoading = true;
    update();
    try {
      final credential = auth.PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode!,
      );
      final user = await loginFirebaseCredential(credential: credential);
      if (user != null) {
        _fullnumber = _fullnumber.replaceAll('+', '').replaceAll(' ', '');
        return true;
      }
    } on auth.FirebaseAuthException catch (error) {
      showCustomSnackBar(error.message!, Get.context!, isError: true);
    }
    _isLoading = false;
    update();
    return false;
  }

  Future<User> loginFirebaseCredential({credential}) async {
    return (await _auth.signInWithCredential(credential)).user!;
  }
}
