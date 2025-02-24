import 'package:bunny_ngim_app/view/base/show_custom_snackbar_widget.dart';
import 'package:get/get.dart';

class ApiChecker {
  static bool isLoggingOut = false;
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      if (!isLoggingOut) {
        isLoggingOut = true;
        // Get.find<AuthController>().logoutDirect();
      }
    } else if (response.statusCode == 500) {
      print('===> Error 500, Internal Server Error <====');
    } else if (response.statusCode == 422) {
      showCustomSnackBar(
        response.statusText!,
        Get.context!,
        isToaster: true,
        isError: true,
      );
    } else {
      showCustomSnackBar(response.statusText!, Get.context!);
    }
  }
}
