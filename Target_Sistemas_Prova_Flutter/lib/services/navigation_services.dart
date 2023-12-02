import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/services/mob_x.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NextScreen extends StatefulWidget {
  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final NextScreenStore store = NextScreenStore();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          color: Colors.black,
          width: double.infinity,
          child: Column(
            children: [
              Container(color: Colors.yellow, child: SizedBox(width: double.infinity, height: 50,),),

              Container(color: Colors.green, child: SizedBox(width: double.infinity, height: 380, child: Card(color: Colors.white70, child: Column(children: [ TextFormField(controller: textController,), ],),),),),

              Container(color: Colors.blue, child: SizedBox(width: double.infinity, height: 50,),),

              Container(color: Colors.grey, child: SizedBox(width: double.infinity, height: 50, child: TextFormField(),),),

              Container(color: Colors.pink, child: SizedBox(width: double.infinity, height: 100,),),

              Container(color: Colors.purple, child: SizedBox(width: double.infinity, height: 50, child: Center(child: Text('Política de Privacidade',),),),),

              Container(color: Colors.red, child: SizedBox(width: double.infinity, height: 50,),),
            ],
          ),
        ),
      ),
    );
  }
}



/* Services - Navigation Services */
Future<void> urlLink(String url) async {
  await canLaunchUrlString(url) ? await launchUrlString(url) :  throw "It is now allowed to open $url";
} /* Services - Navigation Services */


