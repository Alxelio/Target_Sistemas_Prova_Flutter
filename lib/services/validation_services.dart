import 'package:flutter/material.dart';
import 'package:projeto_flutter_target_sistemas/presentation/widgets/message_dialog.dart';
import 'package:projeto_flutter_target_sistemas/services/authentication_services.dart';
import 'package:projeto_flutter_target_sistemas/services/navigation_services.dart';

Future<String?> createErrorMessagePopUp(
  BuildContext context,
  String message,
) async {
  MessageDialog messageDialog = MessageDialog();
  Future.delayed(const Duration(seconds: 1), () {
    messageDialog.displayMessage(context, message);
  });
}

void loginPressed(
  BuildContext context,
  TextEditingController userController,
  TextEditingController passwordController,
) async {
  String user = userController.text;
  String password = passwordController.text;

  String errorMessage = validateFields(user, password);

  if (!errorMessage.isEmpty) {
    createErrorMessagePopUp(context, errorMessage);
  }

  if (MockAPI.validate_Credentials(user, password)) {
    login(context);
  } else {
    createErrorMessagePopUp(context, "Ops! Usuário ou senha não conferem. Por favor insira as informações corretas!");
  }
}

void login(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NextScreen(),
    ),
  );
}

class Error {
  String message = "";
}

String validateFields(
    String user,
    String password,
) {
  if (IsEndingWithSpace(user)) {
    return "O campo usuário não pode terminar com espaços vazios! Retirei os espaços vazios do final. Aperte Entrar novamente por favor.";
  }
  if (IsEndingWithSpace(password)) {
    return "O campo senha não pode terminar com espaços vazios! Retirei os espaços vazios do final. Aperte Entrar novamente por favor.";
  }
  if (IsEmpty(user)) {
    return "Campo do usuário está vazio, por favor preencha-o!";
  }
  if (IsEmpty(password)) {
    return "Campo da senha está vazio, por favor preencha-o!";
  }
  if (IsPasswordSizeBetweenTwoAndTwenty(password)) {
    return "O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20!";
  }
  if (IsUserSizeLessThanTwenty(user)) {
    return "O número de caracteres no campo usuário deve ser menor ou igual a 20!";
  }
  if (IsPasswordOnlyAlphanumeric(password)) {
    return "Caracteres especiais não são aceitos na senha * @ #  % ? !";
  }
  return "";
}

bool IsEndingWithSpace(String field) {
  return field.endsWith(" ");
}
bool IsEmpty(String field) {
  return field.isEmpty;
}
bool IsPasswordSizeBetweenTwoAndTwenty(String user) { return false; }
bool IsUserSizeLessThanTwenty(String user) { return false; }
bool IsPasswordOnlyAlphanumeric(String user) { return false; }