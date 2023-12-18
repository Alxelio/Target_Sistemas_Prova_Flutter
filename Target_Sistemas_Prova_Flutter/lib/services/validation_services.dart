import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/presentation/widgets/message_dialog.dart';
import 'package:projeto_flutter_target_sistemas/services/authentication_services.dart';
import 'package:projeto_flutter_target_sistemas/services/navigation_services.dart';

Future<String?> userFieldEndsEmpty(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  Future.delayed(const Duration(seconds: 1), () {
    messageDialog.displayMessage(context,
        "O campo usuário não pode terminar com espaços vazios! Retirei os espaços vazios do final. Aperte Entrar novamente por favor.");
    userController.text = userController.text.trim();
  });
  return userController.text;
}

Future<String?> passwordFieldEndsEmpty(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  Future.delayed(const Duration(seconds: 1), () {
    messageDialog.displayMessage(context,
        "O campo senha não pode terminar com espaços vazios! Retirei os espaços vazios do final. Aperte Entrar novamente por favor.");
    passwordController.text = passwordController.text.trim();
  });
  return passwordController.text;
}

Future<String?> userFieldIsEmpty(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  messageDialog.displayMessage(
      context, "Campo do usuário está vazio, por favor preencha-o!");
  return userController.text;
}

Future<String?> passwordFieldIsEmpty(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  messageDialog.displayMessage(
      context, "Campo da senha está vazio, por favor preencha-o!");
  return passwordController.text;
}

Future<String?> passwordNumberCharacteres(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  messageDialog.displayMessage(context,
      "O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20!");
  return passwordController.text;
}

Future<String?> userNumberCharacteres(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  messageDialog.displayMessage(context,
      "O número de caracteres no campo usuário deve ser menor ou igual a 20!");
  return userController.text;
}

Future<String?> passwordSpecialCharacteres(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  messageDialog.displayMessage(
      context, "Caracteres especiais não são aceitos na senha * @ #  % ? !");
  return passwordController.text;
}

Future<void> mockApiFake(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  MessageDialog messageDialog = MessageDialog();
  bool return200 = await MockAPI.validate_Credentials(
      userController.text, passwordController.text);

  if (return200 == true) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NextScreen(),
      ),
    );
  } else {
    messageDialog.displayMessage(context,
        "Ops! Usuário ou senha não conferem. Por favor insira as informações corretas!");
    return;
  }
}

void loginPressed(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  if (userController.text.endsWith(" ")) {
    await userFieldEndsEmpty(context,userController,passwordController,);
  } else {
    if (passwordController.text.endsWith(" ")) {
      await passwordFieldEndsEmpty(context, userController, passwordController,);
    } else {
      if (userController.text.isEmpty) {
        await userFieldIsEmpty(context, userController, passwordController,);
      } else {
        if (passwordController.text.isEmpty) {
          await passwordFieldIsEmpty(context, userController, passwordController,);
        } else {
          if (passwordController.text.length < 2 || passwordController.text.length > 20) {
            await passwordNumberCharacteres(context, userController, passwordController,);
          } else {
            if (userController.text.length > 20) {
              await userNumberCharacteres(context, userController, passwordController,);
            } else {
              if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(passwordController.text)) {
                await passwordSpecialCharacteres(context, userController, passwordController,);
              } else {
                await mockApiFake(context, userController, passwordController,);
              }
            }
          }
        }
      }
    }
  }
}
