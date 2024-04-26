
String? passwordValidation (String password) {

  if(!validFormatation(password)){
      return 'Senha inválida';
    }
    return null;
}

  bool validFormatation(String text){
    return RegExp(r'^(?=.*\d)(?=\S{5,}$).*$').hasMatch(text);
  }