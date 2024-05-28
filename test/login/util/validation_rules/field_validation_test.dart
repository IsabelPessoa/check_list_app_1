import 'package:check_list_app_1/login/util/validation_rules/field_validations.dart';
import 'package:flutter_test/flutter_test.dart';

class FieldValidationMixinMock with FieldValidationMixin {}

void main() {
  // O email deve seguir as seguintes regras:
  //   - Deve ter local.
  //   - Deve conter o caractere '@'.
  //   - Deve possuir ao menos 2 caracteres entre o '@' e '.'.
  //   - Deve possuir entre 2 e 4 caracteres após '.'.
  //   - Não deve possuir espaços.

  FieldValidationMixinMock validator = FieldValidationMixinMock();

  group("Test email_rules: ", () {
    test("Deve retornar null quando o email é válido", () {
      expect(validator.isNotValidEmail('exemple@gmail.com'), null);
      expect(validator.isNotValidEmail('exemple1@gmail.com.br'), null);
      expect(validator.isNotValidEmail('exemple2@gmail.com.test.br'), null);
      expect(validator.isNotValidEmail('exemple_3@gmail.com'), null);
      expect(validator.isNotValidEmail('exemple-4@gmail.com'), null);
      expect(validator.isNotValidEmail('EXEMPLE5@gmail.com'), null);
    });
    test("Deve retornar como inválido caso o email possua espaços", () {
      expect(validator.isNotValidEmail('exemple 2@gmail.com'),
          invalidEmailMessage);
    });

    test("Deve retornar como inválido caso o email não possua local", () {
      expect(validator.isNotValidEmail('@exemple3.co'), invalidEmailMessage);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (entre o '@' e o '.')",
        () {
      expect(validator.isNotValidEmail('exemple4@.com'), invalidEmailMessage);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (depois do primeiro '.')",
        () {
      expect(
          validator.isNotValidEmail('exemple5@gmail.c'), invalidEmailMessage);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (não possui pontos apos o '@')",
        () {
      expect(
          validator.isNotValidEmail('exemple6@gmailcom'), invalidEmailMessage);
    });

    test(
        "Deve retornar como inválido caso o email não possua domínio completo (não possui pontos apos o '@' mas possui antes)",
        () {
      expect(
          validator.isNotValidEmail('exemple.7@gmailcom'), invalidEmailMessage);
    });

    test("Deve retornar como inválido caso o campo de email esteja vazio", () {
      expect(validator.isNotEmpty(''), emptyMessage);
    });
  });
  group("Test password_rules: ", () {
    test("Deve retornar null quando a senha é válida", () {
      expect(validator.isNotValidPassword('Senha0'), null);
      expect(validator.isNotValidPassword('SENHA1'), null);
      expect(validator.isNotValidPassword('senha2'), null);
      expect(validator.isNotValidPassword('Senha_3'), null);
      expect(validator.isNotValidPassword('Senha-4'), null);
      expect(validator.isNotValidPassword('Senha5*'), null);
    });
    test("Deve retornar como inválido caso a senha possua espaços", () {
      expect(validator.isNotValidPassword('Senha 0'), invalidPasswordMessage);
    });

    test(
        "Deve retornar como inválido caso a senha não tenha ao menos 5 caracteres",
        () {
      expect(validator.isNotValidPassword('Pw1'), invalidPasswordMessage);
    });

    test(
        "Deve retornar como inválido caso a senha não tenha ao menos um número",
        () {
      expect(validator.isNotValidPassword('Senha'), invalidPasswordMessage);
    });
    test("Deve retornar como inválido caso o campo de Senha esteja vazio", () {
      expect(validator.isNotEmpty(''), emptyMessage);
    });
  });
}

String invalidEmailMessage = 'Email inválido';
String invalidPasswordMessage = 'Senha inválida';
String emptyMessage = 'Este campo é obrigatório';
