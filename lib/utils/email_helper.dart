import 'package:url_launcher/url_launcher.dart';

void openEmail() async {
  final subject = Uri.encodeComponent('Contact - Application Ganache.lab');
  final body = Uri.encodeComponent('Bonjour,\nJe vous contacte car...');
  final Uri emailUri = Uri.parse('mailto:hadrien.ganache@pm.me?subject=$subject&body=$body');

  if (!await launchUrl(emailUri, mode: LaunchMode.externalApplication)) {
    print('Impossible d\'ouvrir l\'application mail');
  }
}
