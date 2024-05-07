mixin EmailValidationMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value == null) return message ?? "Este campo é obrigatório";
    return null;
  }

  String? isNotValid(String? value, [String? message]) {
    if (validFormatation(value!)) {
      return 'Email inválido';
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}

String? emailValidation(String text) {
  if (!validFormatation(text)) {
    return 'Email inválido';
  }

  if (!validFormatation(text)) {
    return 'Email inválido';
  }
  return null;
}

bool validFormatation(String text) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text);
}
