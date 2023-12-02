import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_flutter_target_sistemas/entities/credentials.dart';

class ValidationServices {
  userFieldEndsEmpty(String? user, String? password) {
    if (user!.endsWith(" ")) {
      return 'O campo usuário não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.';
    }
  }



  passwordFieldEndsEmpty(String? user, String? password) {
    if (password!.endsWith(" ")) {
      return 'O campo senha não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.';
    }
  }



  userFieldIsEmpty(String? user, String? password) {
    if (user!.isEmpty) {
      return 'Campo do usuário está vazio, por favor preencha-o !';
    }
  }



  passwordFieldIsEmpty(String? user, String? password) {
    if (password!.isEmpty) {
      return 'Campo da senha está vazio, por favor preencha-o !';
    }
  }



  passwordNumberCharacteres(String? user, String? password) {
    if (password!.length < 2 || password.length > 20) {
      return 'O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20 !';
    }
  }



  userNumberCharacteres(String? user, String? password) {
    if (user!.length > 20) {
      return 'O número de caracteres no campo usuário deve ser menor ou igual a 20 !';
    }
  }



  passwordSpecialCharacteres(String? user, String? password) {
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password!)) {
      return 'Caracteres especiais não são aceitos na senha !';
    }
  }


}

void main() {
  late Credentials credentials;
  late ValidationServices validationServices = ValidationServices();

  group('It should return an error message', () {
    test(
        'It should return an error message if it has empty spaces at the end of user field!',
        () {
      final result =
          validationServices.userFieldEndsEmpty('Target ', 'Sistemas ');
      expect(
          result,
          equals(
              'O campo usuário não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.'));
    });


    test(
        'It should return an error message if it has empty spaces at the end of password field!',
        () {
      final result =
          validationServices.passwordFieldEndsEmpty('Target', 'Sistemas ');
      expect(
          result,
          equals(
              'O campo senha não pode terminar com espaços vazios ! Retire por favor o espaço vazio do final.'));
    });


    test(
        'It should return an error message if there is no charactere at user field !',
        () {
      final result = validationServices.userFieldIsEmpty('', 'senha');
      expect(result,
          equals('Campo do usuário está vazio, por favor preencha-o !'));
    });


    test(
        'It should return an error message if there is no charactere at password field !',
        () {
      final result = validationServices.passwordFieldIsEmpty('usuario', '');
      expect(
          result, equals("Campo da senha está vazio, por favor preencha-o !"));
    });


    test(
        'It should return an error message if the password length is less than 2 or greater than 20 characteres !',
        () {
      final result =
          validationServices.passwordNumberCharacteres('Target', 'S');
      expect(
          result,
          equals(
              'O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20 !'));
    });

    test(
        'It should return an error message if the password length is less than 2 or greater than 20 characteres !',
            () {
          final result =
          validationServices.passwordNumberCharacteres('Target', 'SistemasSistemasSistemas');
          expect(
              result,
              equals(
                  'O número de caracteres no campo senha deve ser maior ou igual a 2 e menor ou igual a 20 !'));
        });

    test(
        'It should return an error message if the user length is greater than 20 characteres !',
        () {
      final result =
          validationServices.userNumberCharacteres('usuarioTargetSistemas', 'senha');
      expect(
          result,
          equals(
              'O número de caracteres no campo usuário deve ser menor ou igual a 20 !'));
    });


    test(
        'It should return an error message if there is any special character !',
        () {
      final result =
          validationServices.passwordSpecialCharacteres('usuario', 'senha*');
      expect(
          result,
          equals(
              'Caracteres especiais não são aceitos na senha !'));
    });

  });
}


