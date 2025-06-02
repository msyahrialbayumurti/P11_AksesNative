import 'package:url_launcher/url_launcher.dart';

Future<void> launchWebsite(String url) async {
  final Uri uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}