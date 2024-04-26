
String? emailValidation (String text){
    if(!validFormatation(text)){
      return 'Email inválido';
    }
    return null;
  }

  bool validFormatation(String text){
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text);
  }