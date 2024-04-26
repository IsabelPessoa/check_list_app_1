import 'package:flutter_test/flutter_test.dart';
import 'package:check_list_app_1/login/util/validation_rules/verify_user.dart';

void main() {
  group("Teste de verify_user(): ", () {
    test(
        'Deve retornar null quando email e password forem correspondentes aos do usuário',
        () {
      // Arrange
      String userEmail = "Exemple.correct@gmail.com";
      String userPassword = "ExempleCorrect1";

      String emailTest = "Exemple.correct@gmail.com";
      String passwordTest = "ExempleCorrect1";
      // Act
      String? result = verifyUser(
          email: emailTest,
          userEmail: userEmail,
          password: passwordTest,
          userPassword: userPassword);
      // Assert
      expect(result, null);
    });

    test(
        'Deve retornar erro quando email e password não forem correspondentes aos do usuário',
        () {
      String userEmail = "Exemple.correct@gmail.com";
      String userPassword = "ExempleCorrect1";

      String emailTest = "exemple2@gmail.com";
      String passwordTest = "exemple2";

      String? result = verifyUser(
          email: emailTest,
          userEmail: userEmail,
          password: passwordTest,
          userPassword: userPassword);
      expect(result, isNotNull);
    });

    test(
        'Deve retornar erro quando apenas password não for correspondente ao do usuário',
        () {
      String userEmail = "Exemple.correct@gmail.com";
      String userPassword = "ExempleCorrect1";

      String emailTest = "Exemple.correct@gmail.com";
      String passwordTest = "exemple3";

      String? result = verifyUser(
          email: emailTest,
          userEmail: userEmail,
          password: passwordTest,
          userPassword: userPassword);
      expect(result, isNotNull);
    });

    test(
        'Deve retornar erro quando apenas email não for correspondente ao do usuário',
        () {
      String userEmail = "Exemple.correct@gmail.com";
      String userPassword = "ExempleCorrect1";

      String emailTest = "exemple4@gmail.com";
      String passwordTest = "ExempleCorrect1";

      String? result = verifyUser(
          email: emailTest,
          userEmail: userEmail,
          password: passwordTest,
          userPassword: userPassword);
      expect(result, isNotNull);
    });

    test(
        'Deve retornar erro quando apenas password estiver com seu campo vazio',
        () {
      String userEmail = "Exemple.correct@gmail.com";
      String userPassword = "ExempleCorrect1";

      String emailTest = "Exemple.correct@gmail.com";
      String passwordTest = "";

      String? result = verifyUser(
          email: emailTest,
          userEmail: userEmail,
          password: passwordTest,
          userPassword: userPassword);
      expect(result, isNotNull);
    });

    test(
        'Deve retornar erro quando apenas password estiver com o seu campo vazio',
        () {
      String userEmail = "Exemple.correct@gmail.com";
      String userPassword = "ExempleCorrect1";

      String emailTest = "";
      String passwordTest = "ExempleCorrect1";

      String? result = verifyUser(
          email: emailTest,
          userEmail: userEmail,
          password: passwordTest,
          userPassword: userPassword);
      expect(result, isNotNull);
    });

    test(
        'Deve retornar erro quando password e email estiverem com o seus campos vazios',
        () {
      String userEmail = "Exemple.correct@gmail.com";
      String userPassword = "ExempleCorrect1";

      String emailTest = "";
      String passwordTest = "";

      String? result = verifyUser(
          email: emailTest,
          userEmail: userEmail,
          password: passwordTest,
          userPassword: userPassword);
      expect(result, isNotNull);
    });
  });
}
