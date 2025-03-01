// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';

// class FacebookLoginController extends GetxController implements GetxService {
//   late Map userData;
//   late LoginResult result;

//   Future<void> login() async {
//     result =
//         await FacebookAuth.instance
//             .login(); // by default we request the email and the public profile
//     if (result.status == LoginStatus.success) {
//       userData = await FacebookAuth.instance.getUserData();
//     } else {
//       print(result.status);
//       print(result.message);
//     }
//     update();
//   }

//   logOut() async {
//     await FacebookAuth.instance.logOut();
//     update();
//   }
// }
