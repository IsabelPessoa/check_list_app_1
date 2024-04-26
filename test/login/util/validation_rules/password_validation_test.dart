import 'package:check_list_app_1/login/util/validation_rules/password_validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late String expectResult;
  setUp(() {
    expectResult = 'Senha inválida';
  });

  // A senha deve seguir as seguintes regras:
  //   - Deve ter ao menos 5 caracteres.
  //   - Deve aceitar caracteres especiais.
  //   - Deve ter ao menos 1 número.
  //   - Não deve conter espaços.

  group("Teste password_validation(): ", () {
    test("Deve retornar null quando a senha é válida", () {
      String? password = "exemple1";
      String? result = passwordValidation(password);
      expect(result, null);
    });

    test(
        "Deve retornar null quando a senha é válida e possui caracteres especiais",
        () {
      String? password = "exemple1*(-+);";
      String? result = passwordValidation(password);
      expect(result, null);
    });

    test(
        "Caso a senha possua menos de 5 caracteres deve retornar como inválida",
        () {
      String? password = "ex2";
      String? result = passwordValidation(password);
      expect(result, expectResult);
    });

    test("Caso a senha possua espaços deve retornar como inválida", () {
      String? password = "exemple 3";
      String? result = passwordValidation(password);
      expect(result, expectResult);
    });

    test("Caso a senha não possua nenhum número deve retornar como inválida",
        () {
      String? password = expectResult;
      String? result = passwordValidation(password);
      expect(result, expectResult);
    });

    test(
        "Caso o campo de senha esteja vazio, a senha deve retornar como inválida",
        () {
      String? password = "";
      String? result = passwordValidation(password);
      expect(result, expectResult);
    });
  });
}
