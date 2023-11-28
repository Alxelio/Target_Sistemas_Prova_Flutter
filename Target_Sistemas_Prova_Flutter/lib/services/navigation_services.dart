import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

/* Services - Navigation Services */
class NextScreen extends StatefulWidget {
  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Page"),
        ),
      ),
    );
  }

} /* Services - Navigation Services */

/* Services - Navigation Services */
Future<void> urlLink(String url) async {
  await canLaunchUrlString(url) ? await launchUrlString(url) :  throw "It is now allowed to open $url";
} /* Services - Navigation Services */

