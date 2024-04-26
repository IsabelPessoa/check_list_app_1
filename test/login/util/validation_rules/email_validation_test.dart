import 'package:flutter_test/flutter_test.dart';
import 'package:check_list_app_1/login/util/validation_rules/email_validation.dart';

void main() {
  // O email deve seguir as seguintes regras:
  //   - Deve ter local.
  //   - Deve conter o caractere '@'.
  //   - Deve possuir ao menos 2 caracteres entre o '@' e '.'.
  //   - Deve possuir entre 2 e 4 caracteres após '.'.
  //   - Não deve possuir espaços.

  group("Teste email_validation(): ", () {
    test("Deve retornar null quando o email é válido", () {
      // Arrange
      String? email = "exemple0@gmail.com";
      // Act
      String? result = emailValidation(email);
      // Assert
      expect(result, null);
    });

    test("Deve retornar como válido caso o email possua '.br'", () {
      String? email = "exemple1@gmail.com.br";
      String? result = emailValidation(email);
      expect(result, null);
    });

    test("Deve retornar como inválido caso o email possua espaços", () {
      String? email = "exemple 2@gmail.com";
      String? result = emailValidation(email);
      expect(result, isNotNull);
    });

    test("Deve retornar como inválido caso o email não possua local", () {
      String? email = "@exemple3.co";
      String? result = emailValidation(email);
      expect(result, isNotNull);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (entre o '@' e o '.')",
        () {
      String? email = "exemple4@.com";
      String? result = emailValidation(email);
      expect(result, isNotNull);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (depois do primeiro '.')",
        () {
      String? email = "exemple5@gmail.c";
      String? result = emailValidation(email);
      expect(result, isNotNull);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (não possui pontos apos o '@')",
        () {
      String? email = "exemple6@gmailcom";
      String? result = emailValidation(email);
      expect(result, isNotNull);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (não possui pontos apos o '@' mas possui antes)",
        () {
      String? email = "exemple.7@gmailcom";
      String? result = emailValidation(email);
      expect(result, isNotNull);
    });

    test("Deve retornar como inválido caso o campo de email esteja vazio", () {
      String? email = "";
      String? result = emailValidation(email);
      expect(result, isNotNull);
    });
  });
}

final String expectResult = 'Senha inválida';
