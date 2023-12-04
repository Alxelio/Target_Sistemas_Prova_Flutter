import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/presentation/widgets/message_dialog.dart';
import 'package:projeto_flutter_target_sistemas/services/authentication_services.dart';
import 'package:projeto_flutter_target_sistemas/services/navigation_services.dart';

void userFieldEndsEmpty(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( userController.text.endsWith(" ") ) {
    messageDialog.displayMessage(context, "O campo usuário não pode terminar com espaços vazios ! Retirei os espaços vazios do final. Aperte Enter novamente por favor.");

    Future.delayed(const Duration(seconds: 3), () async {
      userController.text = userController.text.trim();
    });
  }
  return;
}

void passwordFieldEndsEmpty(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( passwordController.text.endsWith(" ") ){
    messageDialog.displayMessage(context, "O campo senha não pode terminar com espaços vazios ! Retirei os espaços vazios do final. Aperte Enter novamente por favor.");

    Future.delayed(const Duration(seconds: 3), () async {
      passwordController.text = passwordController.text.trim();
    });
  }
  return;
}

void userFieldIsEmpty(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( userController.text.isEmpty ){
    messageDialog.displayMessage(context, "Campo do usuário está vazio, por favor preencha-o !");
    return;
  }
}

void passwordFieldIsEmpty(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( passwordController.text.isEmpty ){
    messageDialog.displayMessage(context, "Campo da senha está vazio, por favor preencha-o !");
    return;
  }
}

void passwordNumberCharacteres(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( passwordController.text.length < 2 || passwordController.text.length > 20){
    messageDialog.displayMessage(context, "O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20 !");
    return;
  }
}

void userNumberCharacteres(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( userController.text.length > 20){
    messageDialog.displayMessage(context, "O número de caracteres no campo usuário deve ser menor ou igual a 20 !");
    return;
  }
}

void passwordSpecialCharacteres(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(passwordController.text ) ){
    messageDialog.displayMessage(context, "Caracteres especiais não são aceitos na senha !");
    return;
  }
}

void mockApiFake(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message) async {
  MessageDialog messageDialog = MessageDialog();
  bool return200 = await MockAPI.validate_Credentials(userController.text, passwordController.text);

  if( return200 == true ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(),),);
  } else {
    messageDialog.displayMessage(context, "Ops! Usuário ou senha não conferem. Por favor insira as informações corretas !");
    return;
  }

}

void loginPressed(BuildContext context, TextEditingController userController, TextEditingController passwordController, String message) {

  userFieldEndsEmpty(context, userController, passwordController, message);

  passwordFieldEndsEmpty(context, userController, passwordController, message);

  userFieldIsEmpty(context, userController, passwordController, message);

  passwordFieldIsEmpty(context, userController, passwordController, message);

  passwordNumberCharacteres(context, userController, passwordController, message);

  userNumberCharacteres(context, userController, passwordController, message);

  passwordSpecialCharacteres(context, userController, passwordController, message);

  mockApiFake(context, userController, passwordController, message);

}


