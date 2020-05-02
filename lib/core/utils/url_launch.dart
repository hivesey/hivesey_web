import 'package:url_launcher/url_launcher.dart';

class UrlLaunch {
  openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    }
  }
}
