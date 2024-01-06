import 'package:projeto_flutter_target_sistemas/services/authentication_services.dart';
import 'package:test/test.dart';

void main() {
  group("MockAPI -", () {
    test('Não deve validar credenciais se o usuario e senha estiver vazio', () async {
      expect(await MockAPI.validate_Credentials("", ""), false);
    });

    test('Não deve validar credenciais se o usuario estiver vazio', () async {
      expect(await MockAPI.validate_Credentials("", "Sistemas"), false);
    });

    test('Não deve validar credenciais se o senha estiver vazio', () async {
      expect(await MockAPI.validate_Credentials("Target", ""), false);
    });

    test('Deve validar credenciais se usuario Target e senha Sistemas', () async {
      expect(await MockAPI.validate_Credentials("Target", "Sistemas"), true);
    });
  });
}