/* Services - Validation Services */
import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/presentation/widgets/message_dialog.dart';
import 'package:projeto_flutter_target_sistemas/services/authentication_services.dart';
import 'package:projeto_flutter_target_sistemas/services/navigation_services.dart';

void loginPressed(BuildContext context, TextEditingController usuarioController, TextEditingController senhaController, String message) async {
    if( usuarioController.text.endsWith(" ") ){
      displayMessage(context, "O campo usuário não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.");
      return;
    }

    if( senhaController.text.endsWith(" ") ){
      displayMessage(context, "O campo senha não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.");
      return;
    }

    if( usuarioController.text.isEmpty ){
      displayMessage(context, "Campo do usuário está vazio, por favor preencha-o !");
      return;
    }

    if( senhaController.text.isEmpty ){
      displayMessage(context, "Campo da senha está vazio, por favor preencha-o !");
      return;
    }

    if( senhaController.text.length < 2 || senhaController.text.length > 20){
      displayMessage(context, "O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20 !");
      return;
    }

    if( usuarioController.text.length > 20){
      displayMessage(context, "O número de caracteres no campo usuário deve ser menor ou igual a 20 !");
      return;
    }

    if( !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senhaController.text ) ){
      displayMessage(context, "Caracteres especiais não são aceitos na senha !");
      return;
    }

    bool return200 = await MockAPI.validate_Credentials(usuarioController.text, senhaController.text);

    if( return200 == true ){
      Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(),),);
    } else {
      displayMessage(context, "Ops! Usuário ou senha não conferem. Por favor insira as informações corretas !");
      return;
    } /* Services - Validation Services */

  }

