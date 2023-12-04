import 'package:flutter/material.dart';

class MessageDialog {

  void displayMessage(BuildContext context, String message){
    showDialog(context: context, builder: (content) => AlertDialog(
      title: const Text("Erro de validação!"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Entendido"),
        ),
      ],
    ),
    );
    return;
  }

}


