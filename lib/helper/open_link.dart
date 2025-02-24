import 'package:url_launcher/url_launcher_string.dart';

Future<void> openLink(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } else {}
}
