import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/entities/credentials.dart';
import 'package:projeto_flutter_target_sistemas/presentation/pages/login_page.dart';

/* Main.dart */
void main(){
  Credentials credentials = Credentials(
    TextEditingController(),
    TextEditingController(),
    "",
  );

  runApp(MyApp(credentials),);
  //runApp(MyApp2());
} /* Main.dart */

/* Main.dart */
class MyApp extends StatelessWidget {
  final Credentials credentials;
  MyApp(this.credentials);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(credentials),
      //home: MyApp2(),
    );
  }
} /* Main.dart */


