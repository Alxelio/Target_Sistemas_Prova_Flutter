/* Services - Validation Services */
import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/presentation/widgets/message_dialog.dart';
import 'package:projeto_flutter_target_sistemas/services/authentication_services.dart';
import 'package:projeto_flutter_target_sistemas/services/navigation_services.dart';

void userFieldEndsEmpty(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( usuarioController.text.endsWith(" ") ){
    messageDialog.displayMessage(context, "O campo usuário não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.");
    return;
  }
}

void passwordFieldEndsEmpty(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( senhaController.text.endsWith(" ") ){
    messageDialog.displayMessage(context, "O campo senha não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.");
    return;
  }
}

void userFieldIsEmpty(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( usuarioController.text.isEmpty ){
    messageDialog.displayMessage(context, "Campo do usuário está vazio, por favor preencha-o !");
    return;
  }
}

void passwordFieldIsEmpty(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( senhaController.text.isEmpty ){
    messageDialog.displayMessage(context, "Campo da senha está vazio, por favor preencha-o !");
    return;
  }
}

void passwordNumberCharacteres(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( senhaController.text.length < 2 || senhaController.text.length > 20){
    messageDialog.displayMessage(context, "O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20 !");
    return;
  }
}

void userNumberCharacteres(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( usuarioController.text.length > 20){
    messageDialog.displayMessage(context, "O número de caracteres no campo usuário deve ser menor ou igual a 20 !");
    return;
  }
}

void passwordSpecialCharacteres(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message){
  MessageDialog messageDialog = MessageDialog();
  if( !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senhaController.text ) ){
    messageDialog.displayMessage(context, "Caracteres especiais não são aceitos na senha !");
    return;
  }
}


void MockAPIFake(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message) async {
  MessageDialog messageDialog = MessageDialog();
  bool return200 = await MockAPI.validate_Credentials(usuarioController.text, senhaController.text);

  if( return200 == true ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(),),);
  } else {
    messageDialog.displayMessage(context, "Ops! Usuário ou senha não conferem. Por favor insira as informações corretas !");
    return;
  } /* Services - Validation Services */

}


void loginPressed(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message) {

  userFieldEndsEmpty(context, usuarioController, senhaController, message);

  passwordFieldEndsEmpty(context, usuarioController, senhaController, message);

  userFieldIsEmpty(context, usuarioController, senhaController, message);

  passwordFieldIsEmpty(context, usuarioController, senhaController, message);

  passwordNumberCharacteres(context, usuarioController, senhaController, message);

  userNumberCharacteres(context, usuarioController, senhaController, message);

  passwordSpecialCharacteres(context, usuarioController, senhaController, message);

  MockAPIFake(context, usuarioController, senhaController, message);

}


